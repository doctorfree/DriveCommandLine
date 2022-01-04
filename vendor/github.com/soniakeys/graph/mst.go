// Copyright 2014 Sonia Keys
// License MIT: http://opensource.org/licenses/MIT

package graph

import (
	"container/heap"
	"sort"
)

type dsElement struct {
	from NI
	rank int
}

type disjointSet struct {
	set []dsElement
}

func newDisjointSet(n int) disjointSet {
	set := make([]dsElement, n)
	for i := range set {
		set[i].from = -1
	}
	return disjointSet{set}
}

// return true if disjoint trees were combined.
// false if x and y were already in the same tree.
func (ds disjointSet) union(x, y NI) bool {
	xr := ds.find(x)
	yr := ds.find(y)
	if xr == yr {
		return false
	}
	switch xe, ye := &ds.set[xr], &ds.set[yr]; {
	case xe.rank < ye.rank:
		xe.from = yr
	case xe.rank == ye.rank:
		xe.rank++
		fallthrough
	default:
		ye.from = xr
	}
	return true
}

func (ds disjointSet) find(n NI) NI {
	// fast paths for n == root or from root.
	// no updates need in these cases.
	s := ds.set
	fr := s[n].from
	if fr < 0 { // n is root
		return n
	}
	n, fr = fr, s[fr].from
	if fr < 0 { // n is from root
		return n
	}
	// otherwise updates needed.
	// two iterative passes (rather than recursion or stack)
	// pass 1: find root
	r := fr
	for {
		f := s[r].from
		if f < 0 {
			break
		}
		r = f
	}
	// pass 2: update froms
	for {
		s[n].from = r
		if fr == r {
			return r
		}
		n = fr
		fr = s[n].from
	}
}

// Kruskal implements Kruskal's algorithm for constructing a minimum spanning
// forest on an undirected graph.
//
// While the input graph is interpreted as undirected, the receiver edge list
// does not actually need to contain reciprocal arcs.  A property of the
// algorithm is that arc direction is ignored.  Thus only a single arc out of
// a reciprocal pair must be present in the edge list.  Reciprocal arcs (and
// parallel arcs) are allowed though, and do not affect the result.
//
// The forest is returned as an undirected graph.
//
// Also returned is a total distance for the returned forest.
//
// The edge list of the receiver is sorted as a side effect of this method.
// See KruskalSorted for a version that relies on the edge list being already
// sorted.
func (l WeightedEdgeList) Kruskal() (g LabeledUndirected, dist float64) {
	sort.Sort(l)
	return l.KruskalSorted()
}

// KruskalSorted implements Kruskal's algorithm for constructing a minimum
// spanning tree on an undirected graph.
//
// While the input graph is interpreted as undirected, the receiver edge list
// does not actually need to contain reciprocal arcs.  A property of the
// algorithm is that arc direction is ignored.  Thus only a single arc out of
// a reciprocal pair must be present in the edge list.  Reciprocal arcs (and
// parallel arcs) are allowed though, and do not affect the result.
//
// When called, the edge list of the receiver must be already sorted by weight.
// See Kruskal for a version that accepts an unsorted edge list.
//
// The forest is returned as an undirected graph.
//
// Also returned is a total distance for the returned forest.
func (l WeightedEdgeList) KruskalSorted() (g LabeledUndirected, dist float64) {
	ds := newDisjointSet(l.Order)
	g.LabeledAdjacencyList = make(LabeledAdjacencyList, l.Order)
	for _, e := range l.Edges {
		if ds.union(e.N1, e.N2) {
			g.AddEdge(Edge{e.N1, e.N2}, e.LI)
			dist += l.WeightFunc(e.LI)
		}
	}
	return
}

// Prim implements the Jarník-Prim-Dijkstra algorithm for constructing
// a minimum spanning tree on an undirected graph.
//
// Prim computes a minimal spanning tree on the connected component containing
// the given start node.  The tree is returned in FromList f.  Argument f
// cannot be a nil pointer although it can point to a zero value FromList.
//
// If the passed FromList.Paths has the len of g though, it will be reused.
// In the case of a graph with multiple connected components, this allows a
// spanning forest to be accumulated by calling Prim successively on
// representative nodes of the components.  In this case if leaves for
// individual trees are of interest, pass a non-nil zero-value for the argument
// componentLeaves and it will be populated with leaves for the single tree
// spanned by the call.
//
// If argument labels is non-nil, it must have the same length as g and will
// be populated with labels corresponding to the edges of the tree.
//
// Returned are the number of nodes spanned for the single tree (which will be
// the order of the connected component) and the total spanned distance for the
// single tree.
func (g LabeledUndirected) Prim(start NI, w WeightFunc, f *FromList, labels []LI, componentLeaves *Bits) (numSpanned int, dist float64) {
	al := g.LabeledAdjacencyList
	if len(f.Paths) != len(al) {
		*f = NewFromList(len(al))
	}
	b := make([]prNode, len(al)) // "best"
	for n := range b {
		b[n].nx = NI(n)
		b[n].fx = -1
	}
	rp := f.Paths
	var frontier prHeap
	rp[start] = PathEnd{From: -1, Len: 1}
	numSpanned = 1
	fLeaves := &f.Leaves
	fLeaves.SetBit(start, 1)
	if componentLeaves != nil {
		componentLeaves.SetBit(start, 1)
	}
	for a := start; ; {
		for _, nb := range al[a] {
			if rp[nb.To].Len > 0 {
				continue // already in MST, no action
			}
			switch bp := &b[nb.To]; {
			case bp.fx == -1: // new node for frontier
				bp.from = fromHalf{From: a, Label: nb.Label}
				bp.wt = w(nb.Label)
				heap.Push(&frontier, bp)
			case w(nb.Label) < bp.wt: // better arc
				bp.from = fromHalf{From: a, Label: nb.Label}
				bp.wt = w(nb.Label)
				heap.Fix(&frontier, bp.fx)
			}
		}
		if len(frontier) == 0 {
			break // done
		}
		bp := heap.Pop(&frontier).(*prNode)
		a = bp.nx
		rp[a].Len = rp[bp.from.From].Len + 1
		rp[a].From = bp.from.From
		if len(labels) != 0 {
			labels[a] = bp.from.Label
		}
		dist += bp.wt
		fLeaves.SetBit(bp.from.From, 0)
		fLeaves.SetBit(a, 1)
		if componentLeaves != nil {
			componentLeaves.SetBit(bp.from.From, 0)
			componentLeaves.SetBit(a, 1)
		}
		numSpanned++
	}
	return
}

// fromHalf is a half arc, representing a labeled arc and the "neighbor" node
// that the arc originates from.
//
// (This used to be exported when there was a LabeledFromList.  Currently
// unexported now that it seems to have much more limited use.)
type fromHalf struct {
	From  NI
	Label LI
}

type prNode struct {
	nx   NI
	from fromHalf
	wt   float64 // p.Weight(from.Label)
	fx   int
}

type prHeap []*prNode

func (h prHeap) Len() int           { return len(h) }
func (h prHeap) Less(i, j int) bool { return h[i].wt < h[j].wt }
func (h prHeap) Swap(i, j int) {
	h[i], h[j] = h[j], h[i]
	h[i].fx = i
	h[j].fx = j
}
func (p *prHeap) Push(x interface{}) {
	nd := x.(*prNode)
	nd.fx = len(*p)
	*p = append(*p, nd)
}
func (p *prHeap) Pop() interface{} {
	r := *p
	last := len(r) - 1
	*p = r[:last]
	return r[last]
}

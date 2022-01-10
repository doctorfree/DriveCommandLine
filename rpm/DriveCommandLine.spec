Name: DriveCommandLine
Version:    %{_version}
Release:    %{_release}
Summary:    Google Drive Command Line Tools
License:    MIT
URL:        https://gitlab.com/doctorfree/DriveCommandLine
Vendor:     Doctorwhen's Bodacious Laboratory
Packager:   ronaldrecord@gmail.com

%global __os_install_post %{nil}

%description
Manage your Google Drive from the command line

%prep

%build

%install
cp -a %{_sourcedir}/usr %{buildroot}/usr

%pre

%post

%preun

%files
/usr

%changelog

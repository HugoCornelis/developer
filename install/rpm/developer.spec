# This is a sample spec file for wget

%define _topdir	 	~/nerospaces_project/developer/source/snapshots/0
%define name		developer
%define release		1
%define version 	alpha.1
%define buildroot 	%{_topdir}/%{name}-%{version}-root

BuildRoot:		%{buildroot}
Summary: 		Neurospaces Developer Package
License: 		GPL
Name: 			%{name}
Version: 		%{version}
Release: 		%{release}
Source: 		%{name}-%{version}.tar.gz
Prefix: 		/usr/local
Group: 			Science
Vendor: 		Hugo Cornelis <hugo.cornelis@gmail.com>
Packager: 		Mando Rodriguez <mandorodriguez@gmail.com>
URL:			http://www.neurospaces.org

%description
The Neurospaces developer package contains essential tools for Neurospaces development. 
 The Neurospaces project develops software components of neuronal
 simulator that integrate in a just-in-time manner for the
 exploration, simulation and validation of accurate neuronal models.
 Neurospaces spans the range from single molecules to subcellular
 networks, over single cells to neuronal networks.  Neurospaces is
 backwards-compatible with the GENESIS simulator, integrates with
 Python and Perl, separates models from experimental protocols, and
 reads model definitions from declarative specifications in a variety
 of formats.
 This package contains utilities requires for Neurospaces development.

%prep
%setup -q

%build
./configure --prefix=/usr/local
make

%install
make install prefix=$RPM_BUILD_ROOT/usr/local

%clean
rm -rf %{buildroot}

%files
%defattr(-,root,root)
/usr/local/bin/wget
# need to look for a cleaner way to put files here.

%doc %attr(0444,root,root) /usr/local/share/man/man1/wget.1
# need to put whatever docs to link to here.

%changelog
* Mon Apr  5 2010 Mando Rodriguez <mandorodriguez@gmail.com> - 
- Initial build.


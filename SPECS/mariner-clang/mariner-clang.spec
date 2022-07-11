Name: mariner-clang
Version: 0.0.0
Release: 1%{?dist}
Summary: Package to test clang on Mariner 1.0
License: MIT
Source: main.c

BuildRequires: clang

%description
Package to test clang on Mariner 1.0

%prep
cp "%{_sourcedir}/main.c" "%{_builddir}"

%build
clang main.c -o %{name}

%install
cp %{name} %{_bindir}

%files
%{_bindir}/%{name}


Name:  myapp           
Version:    1.0    
Release:        1%{?dist}
Summary:       mygroovy app 

License:        my-bloody-app-license
URL:            you.kidding.com
Source0:      myapp-1.0.tar.gz        
Group: Toys
BuildRequires:     gcc
Requires:	mylib
BuildRequires: mylib


%description
This is my groovy test app to demonstarte how to build rpm's from source

%prep



%setup -q


%build
%configure
make %{?_smp_mflags}


%install
rm -rf $RPM_BUILD_ROOT
%make_install


%clean
[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
/usr/bin/myapp


%doc



%changelog

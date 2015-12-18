
Name:  mylib           
Version:    1.0    
Release:        1%{?dist}
Summary:       mygroovy app 

License:        my-bloody-app-license
URL:            you.kidding.com
Source0:        mylib-1.0.tar.gz        
Group: Toys

BuildRequires: libtool
BuildRequires: gcc

%description
This is my groovy test lib to demonstarte how to build rpm's from source

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
/usr/include/exports.h
/usr/lib64/libmylib.la
/usr/lib64/libmylib.so.0.0.0
/usr/lib64/libmylib.so.0
/usr/lib64/libmylib.so
/usr/lib64/libmylib.a



%doc



%changelog

# RPM Build

* Create a non-admin user ```build``` with home directory
* place ```rpmbuild``` directory at ```/home/build/rpmbuild``` ( a lot of defaults assume this location)
* ```yum install rpm-build rpmdevtools```

# Building RPM package

```
cd SPECS
rpmbuild -ba myapp.spec
rpmbuild -ba myapp.spec
``` 

# Installing RPM packages

```
rpm -ivh xxxx.spc
```




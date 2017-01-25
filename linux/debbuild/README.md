# Debian Package Building

In root of source tree, run

```
dh_make --native --single -y
```
This generates a ```debian``` subdirectory in which it places several **STARTER*** configuration files for the package build

We get a basic ```.deb``` by using running

```
dpkg-buildpackage -uc -us
```

Install using 
```
sudo dpkg -i ../mylib_1.0_amd64.deb
```

in the root of our source tree. This will place the resultant ```.deb``` file in the directory above the root of our source tree.

Do the same for the ```myapp``` source tree.

We need to edit these files to more sophisticated stuff #TBD




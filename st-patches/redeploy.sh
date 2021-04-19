cd ..
rm -rf st
git clone http://git.suckless.org/st
cd st
git apply ../st-patches/*.diff
sed -i 's/static char \*font.*/static char \*font = "PragmataPro Liga:size=12:antialias=true:autohint=true";/' ../st/config.def.h
# sed -i 's/char \*scroll.*/char \*scroll = "scroll";/' ../st/config.def.h
rm -f ../st/config.h
sudo make clean install

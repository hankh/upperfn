#include 'directry.ch'


//-----------------------------------------------------------------------------

function main()
local cFotonaam := "roos.jpg"
local afoto
local ln
 afoto := upperfotos()
 inkey(20)
return nil


function upperfotos()
local adir, adir_d1, ln1, ln_d1, afoto
local olddir := curdir()
local newdir, newdir_d1
local cdirname
local cupperfile

  afoto := {}
  newdir := olddir + "\to-upper"
  curdir("\" + newdir)
  adir := directory(,"D")
  for ln := 1 to len(adir)
     if adir[ln,F_ATTR] == "D"
        cdirname = upper(adir[ln,F_NAME])
        run ("rename " + adir[ln,F_NAME] + " " + cdirname)
        newdir_d1 := newdir + "\" + adir[ln,F_NAME]
        curdir("\" +newdir_d1)
        adir_d1 := directory()
        for ln_d1 := 1 to len(adir_d1)
            if upper(right(adir_d1[ln_d1,F_NAME],3)) == "JPG"
               cupperfile = upper(adir_d1[ln_d1,F_NAME])
               frename(adir_d1[ln_d1,F_NAME] ,cupperfile)
             endif
        next
        curdir("\" +newdir)
     else
        if upper(right(adir[ln,F_NAME],3)) == "JPG"
           cupperfile = upper(adir[ln,F_NAME])
           frename(adir[ln,F_NAME] ,cupperfile)
        endif
     endif
  next
  curdir("\" +olddir)
return afoto


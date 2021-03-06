
if _ACTION ~= "vs2008" then

 project "libopenmpt_example_cxx"
  uuid "ce5b5a74-cdb1-4654-b928-f91725fb57c9"
  language "C++"
  location ( "../../build/" .. _ACTION )
  objdir "../../build/obj/libopenmpt_example_cxx"
  includedirs {
   "../..",
   "../../include/portaudio/bindings/cpp/include",
   "../../include/portaudio/include",
  }
  files {
   "../../examples/libopenmpt_example_cxx.cpp",
  }
  flags { "Unicode" }
  links { "libopenmpt", "miniz", "portaudio", "portaudiocpp", "ksuser", "winmm" }
  dofile "../../build/premake/premake-defaults-EXE.lua"
  dofile "../../build/premake/premake-defaults.lua"

end

 project "libopenmpt_example_c"
  uuid "3f39804d-01c0-479c-ab8b-025683529c57"
  language "C"
  location ( "../../build/" .. _ACTION )
  objdir "../../build/obj/libopenmpt_example_c"
  includedirs {
   "../..",
   "../../include/portaudio/include",
  }
  files {
   "../../examples/libopenmpt_example_c.c",
  }
  flags { "Unicode" }
  links { "libopenmpt", "miniz", "portaudio", "ksuser", "winmm" }
  dofile "../../build/premake/premake-defaults-EXE.lua"
  dofile "../../build/premake/premake-defaults.lua"

 project "libopenmpt_example_c_mem"
  uuid "4db3da91-fafd-43af-b3b7-35699b80aba1"
  language "C"
  location ( "../../build/" .. _ACTION )
  objdir "../../build/obj/libopenmpt_example_c_mem"
  includedirs {
   "../..",
   "../../include/portaudio/include",
  }
  files {
   "../../examples/libopenmpt_example_c_mem.c",
  }
  flags { "Unicode" }
  links { "libopenmpt", "miniz", "portaudio", "ksuser", "winmm" }
  dofile "../../build/premake/premake-defaults-EXE.lua"
  dofile "../../build/premake/premake-defaults.lua"

 project "libopenmpt_example_c_unsafe"
  uuid "696a79ac-65eb-445f-981a-7639c54569f8"
  language "C"
  location ( "../../build/" .. _ACTION )
  objdir "../../build/obj/libopenmpt_example_c_unsafe"
  includedirs {
   "../..",
   "../../include/portaudio/include",
  }
  files {
   "../../examples/libopenmpt_example_c_unsafe.c",
  }
  flags { "Unicode" }
  links { "libopenmpt", "miniz", "portaudio", "ksuser", "winmm" }
  dofile "../../build/premake/premake-defaults-EXE.lua"
  dofile "../../build/premake/premake-defaults.lua"


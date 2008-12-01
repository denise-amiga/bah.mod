' Copyright (c) 2008 Bruce A Henderson
' 
' Permission is hereby granted, free of charge, to any person obtaining a copy
' of this software and associated documentation files (the "Software"), to deal
' in the Software without restriction, including without limitation the rights
' to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
' copies of the Software, and to permit persons to whom the Software is
' furnished to do so, subject to the following conditions:
' 
' The above copyright notice and this permission notice shall be included in
' all copies or substantial portions of the Software.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
' IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
' FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
' AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
' LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
' OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
' THE SOFTWARE.
' 
SuperStrict

Import BRL.Blitz
Import Pub.FreeType
Import Pub.libpng
Import Pub.libjpeg
Import BaH.libxml

Import "../../pub.mod/freetype.mod/include/*.h"
Import "../../pub.mod/libjpeg.mod/*.h"
Import "../../pub.mod/zlib.mod/*.h"
Import "../../bah.mod/libxml.mod/src/*.h"
Import "src/*.h"

Import "src/delegates/jasper/include/*.h"
Import "src/delegates/jasper/*.h"

'Import "src/magick/animate.c"
Import "src/magick/annotate.c"
Import "src/magick/attribute.c"
Import "src/magick/blob.c"
Import "src/magick/channel.c"
Import "src/magick/compare.c"
Import "src/magick/color.c"
Import "src/magick/colorspace.c"
Import "src/magick/command.c"
Import "src/magick/composite.c"
Import "src/magick/compress.c"
Import "src/magick/constitute.c"
Import "src/magick/decorate.c"
Import "src/magick/delegate.c"
Import "src/magick/deprecate.c"
Import "src/magick/display.c"
Import "src/magick/draw.c"
Import "src/magick/effect.c"
Import "src/magick/enhance.c"
Import "src/magick/enum_strings.c"
Import "src/magick/error.c"
Import "src/magick/fx.c"
Import "src/magick/gem.c"
Import "src/magick/image.c"
Import "src/magick/list.c"
Import "src/magick/locale.c"
Import "src/magick/log.c"
Import "src/magick/magic.c"
Import "src/magick/magick.c"
Import "src/magick/magick_endian.c"
Import "src/magick/map.c"
Import "src/magick/memory.c"
Import "src/magick/module.c"
Import "src/magick/monitor.c"
Import "src/magick/montage.c"
Import "src/magick/operator.c"
Import "src/magick/paint.c"
Import "src/magick/pixel_cache.c"
Import "src/magick/pixel_iterator.c"
Import "src/magick/PreRvIcccm.c"
Import "src/magick/profile.c"
Import "src/magick/quantize.c"
Import "src/magick/registry.c"
Import "src/magick/render.c"
Import "src/magick/resize.c"
Import "src/magick/resource.c"
Import "src/magick/segment.c"
Import "src/magick/semaphore.c"
Import "src/magick/shear.c"
Import "src/magick/signature.c"
Import "src/magick/static.c"
Import "src/magick/tempfile.c"
Import "src/magick/timer.c"
Import "src/magick/transform.c"
Import "src/magick/tsd.c"
Import "src/magick/type.c"
Import "src/magick/unix_port.c"
Import "src/magick/utility.c"
Import "src/magick/version.c"
Import "src/magick/omp_data_view.c"
'Import "src/magick/widget.c"
'Import "src/magick/xwindow.c"
?win32
Import "src/magick/nt_base.c"
Import "src/magick/nt_feature.c"
?

' coders
Import "src/coders/art.c"
Import "src/coders/avi.c"
Import "src/coders/avs.c"
Import "src/coders/bmp.c"
Import "src/coders/caption.c"
Import "src/coders/cineon.c"

?win32
Import "src/coders/clipboard.c"
?
Import "src/coders/cmyk.c"
Import "src/coders/cut.c"
Import "src/coders/dcm.c"
Import "src/coders/dcraw.c"
Import "src/coders/dib.c"
Import "src/coders/dps.c"
Import "src/coders/dpx.c"
Import "src/coders/emf.c"
Import "src/coders/ept.c"
Import "src/coders/fax.c"
Import "src/coders/fits.c"
Import "src/coders/fpx.c"
Import "src/coders/gif.c"
Import "src/coders/gradient.c"
Import "src/coders/gray.c"
Import "src/coders/hdf.c"
Import "src/coders/histogram.c"
Import "src/coders/html.c"
Import "src/coders/icon.c"
Import "src/coders/jbig.c"
Import "src/coders/jp2.c"
Import "src/coders/jpeg.c"
Import "src/coders/label.c"
Import "src/coders/bmx_locale.c"
Import "src/coders/logo.c"
Import "src/coders/bmx_map.c"
Import "src/coders/mat.c"
Import "src/coders/matte.c"
Import "src/coders/meta.c"
Import "src/coders/miff.c"
Import "src/coders/mono.c"
Import "src/coders/mpc.c"
Import "src/coders/mpeg.c"
Import "src/coders/mpr.c"
Import "src/coders/msl.c"
Import "src/coders/mtv.c"
Import "src/coders/mvg.c"
Import "src/coders/null.c"
Import "src/coders/otb.c"
Import "src/coders/palm.c"
Import "src/coders/pcd.c"
Import "src/coders/pcl.c"
Import "src/coders/pcx.c"
Import "src/coders/pdb.c"
Import "src/coders/pdf.c"
Import "src/coders/pict.c"
Import "src/coders/pix.c"
Import "src/coders/plasma.c"
Import "src/coders/png.c"
Import "src/coders/pnm.c"
Import "src/coders/preview.c"
Import "src/coders/ps.c"
Import "src/coders/ps2.c"
Import "src/coders/ps3.c"
Import "src/coders/psd.c"
Import "src/coders/pwp.c"
Import "src/coders/rgb.c"
Import "src/coders/rla.c"
Import "src/coders/rle.c"
Import "src/coders/sct.c"
Import "src/coders/sfw.c"
Import "src/coders/sgi.c"
Import "src/coders/stegano.c"
Import "src/coders/sun.c"
Import "src/coders/svg.c"
Import "src/coders/tga.c"
Import "src/coders/tiff.c"
Import "src/coders/tile.c"
Import "src/coders/tim.c"
Import "src/coders/topol.c"
Import "src/coders/ttf.c"
Import "src/coders/txt.c"
Import "src/coders/uil.c"
Import "src/coders/url.c"
Import "src/coders/uyvy.c"
Import "src/coders/vicar.c"
Import "src/coders/vid.c"
Import "src/coders/viff.c"
Import "src/coders/wbmp.c"
Import "src/coders/wmf.c"
Import "src/coders/wpg.c"
Import "src/coders/x.c"
Import "src/coders/xbm.c"
Import "src/coders/xc.c"
Import "src/coders/xcf.c"
Import "src/coders/xpm.c"
Import "src/coders/xtrn.c"
Import "src/coders/xwd.c"
Import "src/coders/yuv.c"

' filters
Import "src/filters/analyze.c"

' magick++

Import "src/Magick++/*.h"

Import "src/Magick++/Blob.cpp"
Import "src/Magick++/TypeMetric.cpp"
Import "src/Magick++/BlobRef.cpp"
Import "src/Magick++/CoderInfo.cpp"
Import "src/Magick++/Color.cpp"
Import "src/Magick++/Drawable.cpp"
Import "src/Magick++/Exception.cpp"
Import "src/Magick++/Functions.cpp"
Import "src/Magick++/Geometry.cpp"
Import "src/Magick++/Image.cpp"
Import "src/Magick++/ImageRef.cpp"
Import "src/Magick++/Montage.cpp"
Import "src/Magick++/Options.cpp"
Import "src/Magick++/Pixels.cpp"
Import "src/Magick++/STL.cpp"
Import "src/Magick++/Thread.cpp"



' jasper
Import "src/delegates/jasper/base/jas_cm.c"
Import "src/delegates/jasper/base/jas_version.c"
Import "src/delegates/jasper/base/jas_debug.c"
Import "src/delegates/jasper/base/jas_getopt.c"
Import "src/delegates/jasper/base/jas_icc.c"
Import "src/delegates/jasper/base/jas_iccdata.c"
Import "src/delegates/jasper/base/jas_image.c"
Import "src/delegates/jasper/base/jas_init.c"
Import "src/delegates/jasper/base/jas_malloc.c"
Import "src/delegates/jasper/base/jas_seq.c"
Import "src/delegates/jasper/base/jas_stream.c"
Import "src/delegates/jasper/base/jas_string.c"
Import "src/delegates/jasper/base/jas_tmr.c"
Import "src/delegates/jasper/base/jas_tvp.c"

Import "src/delegates/jasper/bmp/bmp_cod.c"
Import "src/delegates/jasper/bmp/bmp_dec.c"
Import "src/delegates/jasper/bmp/bmp_enc.c"

Import "src/delegates/jasper/jp2/jp2_cod.c"
Import "src/delegates/jasper/jp2/jp2_dec.c"
Import "src/delegates/jasper/jp2/jp2_enc.c"

Import "src/delegates/jasper/jpc/jpc_bs.c"
Import "src/delegates/jasper/jpc/jpc_util.c"
Import "src/delegates/jasper/jpc/jpc_cs.c"
Import "src/delegates/jasper/jpc/jpc_dec.c"
Import "src/delegates/jasper/jpc/jpc_enc.c"
Import "src/delegates/jasper/jpc/jpc_math.c"
Import "src/delegates/jasper/jpc/jpc_mct.c"
Import "src/delegates/jasper/jpc/jpc_mqcod.c"
Import "src/delegates/jasper/jpc/jpc_mqdec.c"
Import "src/delegates/jasper/jpc/jpc_mqenc.c"
Import "src/delegates/jasper/jpc/jpc_qmfb.c"
Import "src/delegates/jasper/jpc/jpc_t1cod.c"
Import "src/delegates/jasper/jpc/jpc_t1dec.c"
Import "src/delegates/jasper/jpc/jpc_t1enc.c"
Import "src/delegates/jasper/jpc/jpc_t2cod.c"
Import "src/delegates/jasper/jpc/jpc_t2dec.c"
Import "src/delegates/jasper/jpc/jpc_t2enc.c"
Import "src/delegates/jasper/jpc/jpc_tagtree.c"
Import "src/delegates/jasper/jpc/jpc_tsfb.c"

Import "src/delegates/jasper/jpg/jpg_dec.c"
?Not win32
Import "src/delegates/jasper/jpg/jpg_dummy.c"
?
Import "src/delegates/jasper/jpg/jpg_enc.c"
Import "src/delegates/jasper/jpg/jpg_val.c"

Import "src/delegates/jasper/mif/mif_cod.c"

Import "src/delegates/jasper/pgx/pgx_cod.c"
Import "src/delegates/jasper/pgx/pgx_dec.c"
Import "src/delegates/jasper/pgx/pgx_enc.c"

Import "src/delegates/jasper/pnm/pnm_cod.c"
Import "src/delegates/jasper/pnm/pnm_dec.c"
Import "src/delegates/jasper/pnm/pnm_enc.c"

Import "src/delegates/jasper/ras/ras_cod.c"
Import "src/delegates/jasper/ras/ras_dec.c"
Import "src/delegates/jasper/ras/ras_enc.c"

' bzip2
Import "src/delegates/bzip2/*.h"

Import "src/delegates/bzip2/blocksort.c"
Import "src/delegates/bzip2/unzcrash.c"
Import "src/delegates/bzip2/bzip2.c"
Import "src/delegates/bzip2/bzip2recover.c"
Import "src/delegates/bzip2/bzlib.c"
Import "src/delegates/bzip2/bmx_compress.c"
Import "src/delegates/bzip2/crctable.c"
Import "src/delegates/bzip2/decompress.c"
Import "src/delegates/bzip2/huffman.c"
Import "src/delegates/bzip2/mk251.c"
Import "src/delegates/bzip2/randtable.c"
Import "src/delegates/bzip2/spewG.c"



Import "glue.cpp"
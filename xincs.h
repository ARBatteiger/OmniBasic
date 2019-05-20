/********************************************************************************
*                                                                               *
*              F O X   P r i v a t e   I n c l u d e   F i l e s                *
*                                                                               *
*********************************************************************************
* Copyright (C) 1997 by Jeroen van der Zijp.   All Rights Reserved.             *
*********************************************************************************
* This library is free software; you can redistribute it and/or                 *
* modify it under the terms of the GNU Library General Public                   *
* License as published by the Free Software Foundation; either                  *
* version 2 of the License, or (at your option) any later version.              *
*                                                                               *
* This library is distributed in the hope that it will be useful,               *
* but WITHOUT ANY WARRANTY; without even the implied warranty of                *
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU             *
* Library General Public License for more details.                              *
*                                                                               *
* You should have received a copy of the GNU Library General Public             *
* License along with this library; if not, write to the Free                    *
* Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.            *
*********************************************************************************
* $Id: xincs.h,v 1.26 2000/11/10 17:26:31 jeroen Exp $                          *
********************************************************************************/
#ifndef XINCS_H
#define XINCS_H


////////////////////  DO NOT INCLUDE THIS PRIVATE HEADER FILE  //////////////////


/************************  Platform  Dependent  Headers  ***********************/

// Basic includes
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <math.h>
#include <float.h>
#include <string.h>
#include <errno.h>
#include <signal.h>
#include <time.h>
#include <ctype.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <limits.h>

#ifndef WIN32

#include <grp.h>
#include <pwd.h>
#include <fcntl.h>

#else

#ifdef _MSC_VER		/* Microsoft Visual C++ */
#include <direct.h>
#include <io.h>		/* for _access() */
#define stat _stat
#define lstat _stat
#define getcwd _getcwd
#define mkdir _mkdir
#define access _access
#define vsnprintf _vsnprintf
#endif
#ifdef __BORLANDC__	/* Borland C++ Builder */
#include <dir.h>
#include <io.h>         /* for _access() */
#if __BORLANDC__ <= 0x0530 /* C++ Builder 3.0 */
#define vsnprintf(a, b, c, d) vsprintf(a, c, d)
#endif
#endif
#ifdef __MINGW32__      /* GCC MingW32 */
#include <direct.h>
#define vsnprintf _vsnprintf
#endif

#endif

#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif
#ifdef TIME_WITH_SYS_TIME
#include <sys/time.h>
#include <time.h>
#else
#ifdef HAVE_SYS_TIME_H
#include <sys/time.h>
#else
#include <time.h>
#endif
#endif
#ifdef HAVE_SYS_PARAM_H
#include <sys/param.h>
#endif
#ifdef HAVE_SYS_SELECT_H
#if (!defined(__MINGW32__)) && (!defined(hpux))
#include <sys/select.h>
#endif
#endif
#ifdef HAVE_DIRENT_H
#include <dirent.h>
#define NAMLEN(dirent) strlen((dirent)->d_name)
#else
#define dirent direct
#define NAMLEN(dirent) (dirent)->d_namlen
#ifdef HAVE_SYS_NDIR_H
#include <sys/ndir.h>
#endif
#ifdef HAVE_SYS_DIR_H
#include <sys/dir.h>
#endif
#ifdef HAVE_NDIR_H
#include <ndir.h>
#endif
#endif
#ifdef HAVE_XSHM
#include <sys/ipc.h>
#include <sys/shm.h>
#endif


// MS-Windows 
#ifdef WIN32
#ifndef STRICT
#define STRICT
#endif
#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif
#include <windows.h>
#ifndef __CYGWIN__
#include <winsock2.h>
#endif
#include <commctrl.h>   // For _TrackMouseEvent

// X windows includes
#else
#include <X11/X.h>
#include <X11/Xlib.h>
#include <X11/Xcms.h>
#include <X11/Xutil.h>
#include <X11/Xresource.h>
#include <X11/Xatom.h>
#include <X11/cursorfont.h>
#ifdef HUMMINGBIRD
#include <X11/XlibXtra.h>
#endif
#ifdef HAVE_XSHM
#include <X11/extensions/XShm.h>
#endif
#endif

// OpenGL includes
#ifdef HAVE_OPENGL
#include <GL/gl.h>
#include <GL/glu.h>
#ifndef WIN32
#include <GL/glx.h>
#endif
#endif

// Maximum path length
#ifndef MAXPATHLEN
#if defined(PATH_MAX)
#define MAXPATHLEN   PATH_MAX
#elif defined(_MAX_PATH)
#define MAXPATHLEN   _MAX_PATH
#elif defined(MAX_PATH)
#define MAXPATHLEN   MAX_PATH
#else
#define MAXPATHLEN   1024
#endif
#endif

// Modes for access(filename,mode) on Windows
#ifdef WIN32
#ifndef R_OK
#define R_OK 4
#endif
#ifndef W_OK
#define W_OK 2
#endif
#ifndef X_OK
#define X_OK 1
#endif
#ifndef F_OK
#define F_OK 0
#endif
#endif

// Printer stuff
#ifdef WIN32
#if !defined(__CYGWIN__) && !defined(__MINGW32__)
#include <winspool.h>
#endif
#endif


// Shared library support
#ifndef FXAPI
#ifdef WIN32
#ifdef FOXDLL
#ifdef FOXDLL_EXPORTS
#define FXAPI __declspec(dllexport)
#else
#define FXAPI __declspec(dllimport)
#endif
#endif
#endif
#endif

#ifndef FXAPI
#define FXAPI
#endif

/***********************  Platform  Dependent  Typedefs  ***********************/


/***********************  Platform  Dependent  Globals  ************************/


// IBM VisualAge for C++ 3.5
#if defined(__IBMCPP__) && defined(WIN32)
#include <direct.h>
#include <io.h>         /* for _access() */
#define _mkdir(x) mkdir((char *)(x))
#define _vsnprintf(a, b, c, d) vsprintf(a, c, d)  
#define ICON_SMALL      0
#define ICON_BIG        1
#define bool            int

// This declarations come from Microsoft SDK
#define TME_HOVER       0x00000001
#define TME_LEAVE       0x00000002
#define TME_QUERY       0x40000000
#define TME_CANCEL      0x80000000
#define HOVER_DEFAULT   0xFFFFFFFF
#define WM_MOUSEHOVER   0x02A1
#define WM_MOUSELEAVE   0x02A3

typedef struct tagTRACKMOUSEEVENT {
    DWORD cbSize;
    DWORD dwFlags;
    HWND  hwndTrack;
    DWORD dwHoverTime;
} TRACKMOUSEEVENT, *LPTRACKMOUSEEVENT;

WINUSERAPI
BOOL
WINAPI
TrackMouseEvent(
    IN OUT LPTRACKMOUSEEVENT lpEventTrack);

#ifdef __GL_H__
#define GL_COLOR_LOGIC_OP                 0x0BF2
#define GL_POLYGON_OFFSET_POINT           0x2A01
#define GL_POLYGON_OFFSET_LINE            0x2A02
WINGDIAPI void APIENTRY glPolygonOffset (GLfloat factor,GLfloat units);
#endif

#endif

#endif

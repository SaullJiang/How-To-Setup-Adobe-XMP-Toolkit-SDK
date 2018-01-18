Adobe - XMP Developer Centerから`XMP-Toolkit-SDK-CC201607`のzipファイルをダウンロードして展開します。

http://www.adobe.com/devnet/xmp.html

```
$ ls -ltr
drwxr-xr-x@ 16 ryu  staff  544  9 10 23:59 XMP-Toolkit-SDK-CC201607/
```

XMP-Toolkit-SDKが依存している3rd-Party製ライブラリを指定したディレクトリに配置します。

指定されたディレクトリは以下です。
zlibとexpatは、空になっているので、別途、ダウンロードして中に入れてあげる必要があります。

```
$ cd XMP-Toolkit-SDK-CC201607/third-party
$ ls -ltr
drwxr-xr-x@ 3 ryu  staff  102  8  1  2016 zuid/
drwxr-xr-x@ 3 ryu  staff  102  8  1  2016 zlib/
drwxr-xr-x@ 3 ryu  staff  102  8  1  2016 expat/
```

expatから始めます。

以下のURLをブラウザで開き、`expat-2.1.0.tar.gz`をダウンロード

http://sourceforge.net/projects/expat/files/expat/2.1.0/

ダウンロードした`expat-2.1.0.tar.gz`を`expad`ディレクトリ直下に展開します。

```
$ cd expat
$ mv ~/Downloads/expat-2.1.0.tar.gz ./
$ ls -ltr
-rw-r--r--@ 1 ryu  staff     987  8  1  2016 ReadMe.txt
-rw-r--r--@ 1 ryu  staff  562616  9 11 00:24 expat-2.1.0.tar.gz
$ tar zxvf ./expat-2.1.0.tar.gz
$ ls -ltr
total 1112
drwxr-xr-x@ 28 ryu  staff     952  3 25  2012 expat-2.1.0/
-rw-r--r--@  1 ryu  staff     987  8  1  2016 ReadMe.txt
-rw-r--r--@  1 ryu  staff  562616  9 11 00:24 expat-2.1.0.tar.gz
$ mv expat-2.1.0/* ./
$ ls -ltr
-rwxr-xr-x@  1 ryu  staff    1990  9 30  2004 expat.dsw*
-rw-r--r--@  1 ryu  staff    1208 12 29  2005 COPYING
-rw-r--r--@  1 ryu  staff     231  1 19  2009 expat.pc.in
-rw-r--r--@  1 ryu  staff    4652  3  4  2012 configure.in
-rwxr-xr-x@  1 ryu  staff    1768  3  5  2012 CMake.README*
-rwxr-xr-x@  1 ryu  staff    2735  3  5  2012 expat_config.h.cmake*
-rw-r--r--@  1 ryu  staff    2518  3  5  2012 MANIFEST
-rwxr-xr-x@  1 ryu  staff    1512  3  5  2012 ConfigureChecks.cmake*
-rwxr-xr-x@  1 ryu  staff    3299  3  5  2012 CMakeLists.txt*
-rw-r--r--@  1 ryu  staff    5790  3 11  2012 README
-rw-r--r--@  1 ryu  staff    7036  3 19  2012 Makefile.in
-rw-r--r--@  1 ryu  staff   11379  3 25  2012 Changes
drwxr-xr-x@ 13 ryu  staff     442  3 25  2012 amiga/
-rw-r--r--@  1 ryu  staff  304569  3 25  2012 aclocal.m4
-rwxr-xr-x@  1 ryu  staff  565580  3 25  2012 configure*
-rw-r--r--@  1 ryu  staff    2728  3 25  2012 expat_config.h.in
drwxr-xr-x@  8 ryu  staff     272  3 25  2012 doc/
drwxr-xr-x@ 29 ryu  staff     986  3 25  2012 bcb5/
drwxr-xr-x@ 18 ryu  staff     612  3 25  2012 xmlwf/
drwxr-xr-x@  5 ryu  staff     170  3 25  2012 win32/
drwxr-xr-x@  5 ryu  staff     170  3 25  2012 vms/
drwxr-xr-x@ 11 ryu  staff     374  3 25  2012 tests/
drwxr-xr-x@  7 ryu  staff     238  3 25  2012 m4/
drwxr-xr-x@ 29 ryu  staff     986  3 25  2012 lib/
drwxr-xr-x@  6 ryu  staff     204  3 25  2012 examples/
drwxr-xr-x@ 11 ryu  staff     374  3 25  2012 conftools/
-rw-r--r--@  1 ryu  staff     987  8  1  2016 ReadMe.txt
-rw-r--r--@  1 ryu  staff  562616  9 11 00:24 expat-2.1.0.tar.gz
drwxr-xr-x@  2 ryu  staff      68  9 11 00:29 expat-2.1.0/
```

つづいて、zlibをダウンロードして、`zlib`ディレクトリ直下に展開します。

```
$ cd ../zlib
$ wget http://www.zlib.net/fossils/zlib-1.2.0.8.tar.gz
$ tar zxvf ./zlib-1.2.0.8.tar.gz
$ ls -ltr
total 688
drwxr-xr-x  43 ryu  staff    1462 11  9  2003 zlib-1.2.0.8/
-rw-r--r--   1 ryu  staff  348094 11  9  2003 zlib-1.2.0.8.tar.gz
-rwxr-xr-x@  1 ryu  staff     393  8  1  2016 ReadMe.txt*
$ mv ./zlib-1.2.0.8/* ./
$ ls -ltr
total 1848
-rw-r--r--   1 ryu  staff    8444  2 24  1998 trees.h
-rw-r--r--   1 ryu  staff    6343 11 25  2002 inffixed.h
-rw-r--r--   1 ryu  staff     407  1  2  2003 inffast.h
-rw-r--r--   1 ryu  staff   30568  1  6  2003 crc32.h
-rw-r--r--   1 ryu  staff    9336  6  2  2003 algorithm.txt
-rw-r--r--   1 ryu  staff    2087  7  7  2003 uncompr.c
-rw-r--r--   1 ryu  staff    2489  7  7  2003 compress.c
-rw-r--r--   1 ryu  staff   11942  7 24  2003 deflate.h
-rw-r--r--   1 ryu  staff    2373  8 11  2003 inftrees.h
-rw-r--r--   1 ryu  staff   22038  8 12  2003 infback.c
-rw-r--r--   1 ryu  staff    1162  8 24  2003 INDEX
-rw-r--r--   1 ryu  staff    7007  8 28  2003 zutil.c
drwxr-xr-x   7 ryu  staff     238  8 29  2003 msdos/
-rw-r--r--   1 ryu  staff    9723  9  8  2003 crc32.c
-rw-r--r--   1 ryu  staff    5802  9  8  2003 inflate.h
-rw-r--r--   1 ryu  staff   14142  9 10  2003 FAQ
-rw-r--r--   1 ryu  staff   16436  9 14  2003 example.c
-rw-r--r--   1 ryu  staff   12192  9 14  2003 inffast.c
-rw-r--r--   1 ryu  staff   44041  9 15  2003 trees.c
drwxr-xr-x   4 ryu  staff     136  9 19  2003 amiga/
drwxr-xr-x   8 ryu  staff     272  9 21  2003 old/
-rw-r--r--   1 ryu  staff    6391  9 21  2003 zutil.h
-rw-r--r--   1 ryu  staff    2220 10  6  2003 adler32.c
-rw-r--r--   1 ryu  staff   45355 10 26  2003 inflate.c
drwxr-xr-x   3 ryu  staff     102 10 27  2003 qnx/
-rw-r--r--   1 ryu  staff   13331 10 27  2003 inftrees.c
-rw-r--r--   1 ryu  staff   54966 10 27  2003 deflate.c
-rw-r--r--   1 ryu  staff   30528 10 27  2003 gzio.c
drwxr-xr-x  23 ryu  staff     782 10 27  2003 contrib/
-rw-r--r--   1 ryu  staff    5718 10 27  2003 README
-rw-r--r--   1 ryu  staff    8934 11  5  2003 zconf.in.h
-rw-r--r--   1 ryu  staff    8934 11  5  2003 zconf.h
-rw-r--r--   1 ryu  staff    8005 11  5  2003 minigzip.c
-rw-r--r--   1 ryu  staff    4135 11  5  2003 Makefile.in
-rw-r--r--   1 ryu  staff    4135 11  5  2003 Makefile
-rwxr-xr-x   1 ryu  staff   12653 11  5  2003 configure*
-rw-r--r--   1 ryu  staff   35621 11  5  2003 ChangeLog
-rw-r--r--   1 ryu  staff    4491 11  5  2003 zlib.3
-rw-r--r--   1 ryu  staff   57742 11  5  2003 zlib.h
drwxr-xr-x   9 ryu  staff     306 11  9  2003 win32/
-rw-r--r--   1 ryu  staff  348094 11  9  2003 zlib-1.2.0.8.tar.gz
drwxr-xr-x   6 ryu  staff     204 11  9  2003 as400/
-rwxr-xr-x@  1 ryu  staff     393  8  1  2016 ReadMe.txt*
drwxr-xr-x   2 ryu  staff      68  9 11 00:45 zlib-1.2.0.8/
```


コンパイル時に必要と思われるcmakeを取得します。

cmakeの配置先へ移動します。

```
$ ls
XMP-Toolkit-SDK-CC201607/
$ cd XMP-Toolkit-SDK-CC201607/tools/cmake
```

cmakeをダウンロードします。

```
$ wget https://cmake.org/files/v3.5/cmake-3.5.2-Darwin-x86_64.tar.gz
```

ダウンロードした`cmake-3.5.2-Darwin-x86_64.tar.gz`を展開します。

```
$ tar zxvf ./cmake-3.5.2-Darwin-x86_64.tar.gz
$ ls -ltr
total 44648
-rw-r--r--  1 ryu  staff  22853687  4 16  2016 cmake-3.5.2-Darwin-x86_64.tar.gz
-rw-r--r--@ 1 ryu  staff       986  8  1  2016 ReadMe.txt
drwxr-xr-x  3 ryu  staff       102  9 11 00:49 cmake-3.5.2-Darwin-x86_64/
```

`bin`ディレクトリを作成します。

```
$ mkdir bin
$ ls -ltr
total 44648
drwxr-xr-x  3 ryu  staff       102  4 15  2016 CMake.app/
-rw-r--r--  1 ryu  staff  22853687  4 16  2016 cmake-3.5.2-Darwin-x86_64.tar.gz
-rw-r--r--@ 1 ryu  staff       986  8  1  2016 ReadMe.txt
drwxr-xr-x  2 ryu  staff        68  9 11 00:55 cmake-3.5.2-Darwin-x86_64/
drwxr-xr-x  2 ryu  staff        68  9 11 00:57 bin/
```

`cmake-3.5.2-Darwin-x86_64/`の中身をbinの下に移します。

```
$ mv cmake-3.5.2-Darwin-x86_64/* ./bin/
$ cd bin
$ ls -l
total 0
drwxr-xr-x  3 ryu  staff  102  4 15  2016 CMake.app/
```  

`CMake.app`をリネームします。

```
$ mv -f CMake.app cmake.app
$ ls
cmake.app/
```

つづいて、iOS向けXcodeプロジェクトの生成を行います。

まず、ディレクトリへ移動します。

```
$ ls
$ XMP-Toolkit-SDK-CC201607/
$ cd XMP-Toolkit-SDK-CC201607/build
```

GenerateXMPToolkitSDK_mac.shを実行します。

```
$ ./GenerateXMPToolkitSDK_mac.sh
```

シェルを実行するとはじめに何を生成するか聞かれますので、iOS用の4を選択します。
(４は、armv7, arm64用なので、シミュレータでは動作しないかもしれません。
未確認ですが、Static 64ならシミュレータで動くかもしれません。)

```
1. Clean All
2. Generate XMPToolkitSDK Dynamic 64
3. Generate XMPToolkitSDK Static  64
4. Generate XMPToolkitSDK Static iOS
5. Generate All
Enter your choice:4
```

シェルが完了したら、生成されたXcodeプロジェクトを確認します。

``` 
$ cd xcode/static/ios
$ ls -ltr
total 40
-rw-r--r--  1 ryu  staff   1728  9 11 01:05 cmake_install.cmake
drwxr-xr-x  3 ryu  staff    102  9 11 01:05 XMPToolkitSDK.xcodeproj/
drwxr-xr-x  7 ryu  staff    238  9 11 01:05 CMakeScripts/
drwxr-xr-x  6 ryu  staff    204  9 11 01:05 CMakeFiles/
-rw-r--r--  1 ryu  staff  14003  9 11 01:05 CMakeCache.txt
```

Xcodeから、aファイルを出力します。

先程のディレクトリの中に、`XMPToolkitSDK.xcodeproj`というファイルがあるので、ダブルクリックして、Xcodeでプロジェクトを開きましょう。

上部のSchemeを`Generic iOS Device`に変更して、メニューから、`Product > Build`を実行します。

すると、ビルド成果物が、`XMP-Toolkit-SDK-CC201607/public`に出力されます。

```
$ ls
XMP-Toolkit-SDK-CC201607/
$ cd XMP-Toolkit-SDK-CC201607/public
 tree
.
├── include
│   ├── TXMPFiles.hpp
│   ├── TXMPIterator.hpp
│   ├── TXMPMeta.hpp
│   ├── TXMPUtils.hpp
│   ├── XMP.hpp
│   ├── XMP.incl_cpp
│   ├── XMPCommon
│   │   ├── Interfaces
│   │   │   ├── BaseInterfaces
│   │   │   │   ├── IConfigurable.h
│   │   │   │   ├── ISharedObject.h
│   │   │   │   ├── IThreadSafe.h
│   │   │   │   └── IVersionable.h
│   │   │   ├── IConfigurationManager.h
│   │   │   ├── IError.h
│   │   │   ├── IErrorNotifier.h
│   │   │   ├── IMemoryAllocator.h
│   │   │   ├── IObjectFactory.h
│   │   │   └── IUTF8String.h
│   │   ├── Utilities
│   │   │   ├── TWrapperFunctions.h
│   │   │   └── TWrapperFunctions2.h
│   │   ├── XMPCommonDefines.h
│   │   ├── XMPCommonErrorCodes.h
│   │   ├── XMPCommonFwdDeclarations.h
│   │   ├── XMPCommonLatestInterfaceVersions.h
│   │   └── source
│   │       ├── IConfigurable.cpp
│   │       ├── IConfigurationManager.cpp
│   │       ├── IError.cpp
│   │       ├── IErrorNotifier.cpp
│   │       └── IUTF8String.cpp
│   ├── XMPCore
│   │   ├── Interfaces
│   │   │   ├── IArrayNode.h
│   │   │   ├── IClientDOMParser.h
│   │   │   ├── IClientDOMSerializer.h
│   │   │   ├── ICompositeNode.h
│   │   │   ├── ICoreConfigurationManager.h
│   │   │   ├── ICoreObjectFactory.h
│   │   │   ├── IDOMImplementationRegistry.h
│   │   │   ├── IDOMParser.h
│   │   │   ├── IDOMSerializer.h
│   │   │   ├── IMetadata.h
│   │   │   ├── INameSpacePrefixMap.h
│   │   │   ├── INode.h
│   │   │   ├── INodeIterator.h
│   │   │   ├── IPath.h
│   │   │   ├── IPathSegment.h
│   │   │   ├── ISimpleNode.h
│   │   │   └── IStructureNode.h
│   │   ├── XMPCoreDefines.h
│   │   ├── XMPCoreErrorCodes.h
│   │   ├── XMPCoreFwdDeclarations.h
│   │   ├── XMPCoreLatestInterfaceVersions.h
│   │   └── source
│   │       ├── IArrayNode.cpp
│   │       ├── IClientDOMParser.cpp
│   │       ├── IClientDOMSerializer.cpp
│   │       ├── ICompositeNode.cpp
│   │       ├── ICoreConfigurationManager.cpp
│   │       ├── ICoreObjectFactory.cpp
│   │       ├── IDOMImplementationRegistry.cpp
│   │       ├── IDOMParser.cpp
│   │       ├── IDOMSerializer.cpp
│   │       ├── IMetadata.cpp
│   │       ├── INameSpacePrefixMap.cpp
│   │       ├── INode.cpp
│   │       ├── INodeIterator.cpp
│   │       ├── IPath.cpp
│   │       ├── IPathSegment.cpp
│   │       ├── ISimpleNode.cpp
│   │       └── IStructureNode.cpp
│   ├── XMP_Const.h
│   ├── XMP_Environment.h
│   ├── XMP_IO.hpp
│   ├── XMP_Version.h
│   └── client-glue
│       ├── TXMPFiles.incl_cpp
│       ├── TXMPIterator.incl_cpp
│       ├── TXMPMeta.incl_cpp
│       ├── TXMPUtils.incl_cpp
│       ├── WXMPFiles.hpp
│       ├── WXMPIterator.hpp
│       ├── WXMPMeta.hpp
│       ├── WXMPUtils.hpp
│       └── WXMP_Common.hpp
└── libraries
    └── ios
        └── armv7\ arm64
            └── Debug
                ├── libXMPCoreStatic.a
                └── libXMPFilesStatic.a
```

XMP-Toolkit-SDKをサンプルアプリに組み込みます。

生成された.aファイルやheaderファイルをサンプルアプリのXcodeプロジェクトにコピーします。

```
cp -rf public ../../XMPToolKitSDK-iOS-Sample/XMP-Toolkit-SDK
```

`Targets > XMPToolKitSDK-iOS-Sample > Link Binary With Libraries`に、コピーしてきた２つの.aファイルを追加します。

* libXMPCoreStatic.a
* libXMPFilesStatic.a

同じく、コピーしてきたheaderファイルを`Targets > XMPToolKitSDK-iOS-Sample > Build Settings > User Header Search Paths`に追加します。

* $(PROJECT_DIR)/XMP-Toolkit-SDK/include

`Targets > XMPToolKitSDK-iOS-Sample > Build Settings > Apple LLVM 8.1 - Language - C++ > C++ Standard Library`を`libstdc++`に変更します。

* libstdc++ (GNU C++ standard library)

`IOS_ENV=1`を、`Targets > XMPToolKitSDK-iOS-Sample > Build Settings > Apple LLVM 8.1 - Preprocessing > Preprocessor Macros`に追加します。

最後に、簡単なサンプルを以下に作成しました。

https://github.com/ryu1/XMP-Toolkit-SDK-Workspace/tree/master/XMPToolKitSDK-iOS-Sample/

ライブラリが、C++で書かれているので、直接、呼び出さず、一旦、.mmファイルでWRAPします。(なぜか、.mファイルから直接呼び出すとheaderファイルをC言語と解釈してしまうようです。)

Swiftの場合は、.mmファイルをswift-headerにインポートすれば使用できます。

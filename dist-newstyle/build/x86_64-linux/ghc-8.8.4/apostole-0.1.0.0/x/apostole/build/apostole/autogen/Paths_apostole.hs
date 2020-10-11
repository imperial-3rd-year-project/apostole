{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_apostole (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/rp218/.cabal/bin"
libdir     = "/home/rp218/.cabal/lib/x86_64-linux-ghc-8.8.4/apostole-0.1.0.0-inplace-apostole"
dynlibdir  = "/home/rp218/.cabal/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/rp218/.cabal/share/x86_64-linux-ghc-8.8.4/apostole-0.1.0.0"
libexecdir = "/home/rp218/.cabal/libexec/x86_64-linux-ghc-8.8.4/apostole-0.1.0.0"
sysconfdir = "/home/rp218/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "apostole_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "apostole_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "apostole_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "apostole_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "apostole_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "apostole_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)

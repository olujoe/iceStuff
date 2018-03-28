@echo off
:: variables
set icetea1=\\zgbwcicet7001\ice-tea
set icetea2=\\zgbwcicet7002\ice-tea
set mountcmd=net use
set unmountcmd=/Delete

echo ### Remove mounts (zgbwcicet7001 and zgbwcicet7002) network drives...
%mountcmd% "X:" %unmountcmd%
%mountcmd% "Y:" %unmountcmd%


echo Un-Mount Complete!

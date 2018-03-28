@echo off
:: variables
set icetea1=\\zgbwcicet7001.jupiter.bbc.co.uk\ice-tea
set icetea2=\\zgbwcicet7002.jupiter.bbc.co.uk\ice-tea
set mountcmd=net use
set unmountcmd=/Delete

echo ### Mounting(zgbwcicet7001 and zgbwcicet7002)
network drives...
%mountcmd% "X:" %icetea1%
%mountcmd% "Y:" %icetea2%


echo Mount Complete!

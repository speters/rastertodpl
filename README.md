#rastertodpl CUPS filter for DataMax and Citizen CPL label printers

This is an effort to recreate the `rastertodpl` CUPS filter for DataMax DPL and Citizen CPL label printers.

The original was posted to the old CUPS-development mailing list at https://lists.cups.org/pipermail/cups-devel/2012-September/014208.html and published on the original author's site at  http://www.5of5.com/public/rastertodpl-0.0.4.tar.gz .

An archive of the author's website can be found at http://web.archive.org/web/20110208003821/http://www.5of5.com/ , but it lacks the tar-archives.

Luckily the driver part `rastertodpl.c` could still be found on the net, so I just had to recreate the `Makefile` and `pppd drv`.

## Original description

 > Rastertodpl is a cups filter that works specifically for Datamax I Series label printers but may work with other models that support DPL. This filter is based on the rastertolabel filter currently in CUPS v1.4.3. It uses the PCX file format to send the raster output to Module D (DRAM) of the label printer. Then a label format is created using that image. All the printer commands used in the filter are documented from Datamax's DPL Programming Manual.
> 
 > Rastertodpl has been tested exhaustively with a Datamax I-4206 and M-4206 Label Printers locally connected to serial, parallel, usb, and also network connected using the cups printer spooler. It has also been tested using the Linux Terminal Server Project v5 (LTSP) using spoolerless connections to the parallel port of the client terminal from the server.
> 
> A few edits have been made to Rastertodpl, namely it was updated to use cups 1.4.3, handling multiple labels, copies, and changed from manually delivering ppd files to using a drv file instead.
> 
> Compiling Tips: On Ubuntu other than having a development environment to build packages, make sure that libcups2-dev and libcupsimage2-dev are installed.

## Changes to the original

I changed the printer's image storage space to `C` which is the printer's default location.

The ppd options have also been renamed, as I was trying to get rid of printer-specific options - they are still not settled and might change.

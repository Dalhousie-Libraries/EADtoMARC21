# EADtoMARC21
Process for creating MARC records from EAD
Procedures for Converting EAD Finding Aids to MARC Records

Note: These procedures and the accompanying stylesheet were developed by Geoff Brown and Kathryn Harvey between 2004 and 2007. They may require revisions or modifications.

Note: Steps 1-5 should only have to be done the first time you are using this program.

1.	Open MarcEdit. (The software can be downloaded for free at this address: http://marcedit.reeset.net/ 
2.	Click on MarcMaker in the menu.
3.	Make sure that you are using the correct version of the style sheet. 
	a.	Click on the Tools menu;
	b.	Click on "Edit XML Function List";
	c.	Scroll down and highlight EAD=>MARC in the Defined Functions list;
	d.	Click on Modify;
	e.	make sure that the entry in the XSL StyleSheet Path window points to the modified stylesheet in your MarcEdit XSLT folder.
4.	Make sure that the "Other" box is checked for original format and the MARC box is checked for final format. Click OK and then Close;
5.	With the cursor in the Input file text box, use the Open icon (left most) to browse to the xml version of the finding aid that you want to convert. 
6.	With the cursor in the Output file text box, enter the path and name of where you want the resulting MARC file to be saved. Make sure you name the file with an .mrk extension;
7.	In the XML Functions list, highlight EAD=>MARC;
8.	Click on the Execute button -- you should get a “1 records have been translated." message in the Results text box.
9.	Open and log into Aleph.
10.	In the Records tab, click on the Import Records option;
11.	Use the "..." button next to the Input file text box to browse to the .mrk file you have created;
12.	From the Convert Procedure drop down list, choose MARC;
13.	Click on Convert; the new MARC record should appear in the Output window;
14.	Click on the Edit button to push the record into cataloguing;
15.	Check the record for basic spelling, punctuation errors, etc.  Particularly, look for 'dummy' text in the 5XX fields, 6XX, etc. 
16.	Verify that the url in the 852 field is correct.
17.	Click on the 'save to server' button or Ctrl-L to save. Override any error messages in green. Fix any error messages in red and resave. 
18.	Send the title to cataloguing (include email address) to have them add a holdings record and do an authority check on the new record.

Instructions for Finding Aid Records in the Catalog

Archives will send you the title or control # of the new record. You will need to:

1.	Create a holdings and item record. 
  a.	The URL will need to be cut from the bibrecord and pasted into the 856 field of the holdings record.
  b.	The 852 for the holdings record should be CaNSHD, DLKIL, DKARC; 
  c.	the call number should be the unit ID that the archives has assigned to the collection (MS-2-10, etc.); this should be at the end of the link in the 856 field; and
  d.	the item status should be 49 (non-circulating) and material type MIXED.
2.	The names and subjects may need some clean up and they will need to be checked against the authority list. 



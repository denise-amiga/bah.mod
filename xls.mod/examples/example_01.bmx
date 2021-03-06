SuperStrict

Framework BaH.xls

Local xls:TBasicExcel = New TBasicExcel.Create()

' create sheet 1 and get the associated TBasicExcelWorksheet object
xls.NewWorkbook(1)

Local sheet:TBasicExcelWorksheet = xls.GetWorksheet(0)


Local formatManager:TXLSFormatManager = New TXLSFormatManager.Create(xls)


' Create a table containing an header row in bold and four rows below.

Local font:TExcelFont = New TExcelFont.Create()
font.SetWeight(FW_BOLD)

Local format:TCellFormat = New TCellFormat.Create(formatManager)
format.SetFont(font)

Local col:Int
Local row:Int

For col = 0 Until 10
	Local cell:TBasicExcelCell = sheet.Cell(row, col)

	cell.SetString("TITLE")
	cell.SetFormat(format)
Next

row = 1

While row < 5

	For col = 0 Until 10
		sheet.Cell(row, col).SetString("text")
	Next
	
	row:+ 1
Wend



xls.SaveAs("example_01.xls")

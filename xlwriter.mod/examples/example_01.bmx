SuperStrict

Framework wx.wxApp
Import BaH.XLWriter

New MyApp.run()

Type MyApp Extends wxApp

	Method OnInit:Int()
	
		Local items:String[] = ["Item A", "Item B", "Item C", "Item D", "Item E"]
		Local amounts:Int[] = [9, 8, 7, 6, 5]
		Local prices:Float[] = [6.99, 5.50, 10.0, 25.99, 15.0]
	
		Local doc:TXLDocument = New TXLDocument.Create()
		
		Local sheet:TXLWorksheet = doc.Workbook().AddWorksheet("July 06")
		
		For Local i:Int = 0 Until items.length
			Local row:Int = 3 + i
			sheet.Cell(row, 1).SetValue(items[i])
			sheet.Cell(row, 4).SetValue(prices[i])
			sheet.Cell(row, 5).SetValue(amounts[i])
			
			sheet.Cell(row, 6).SetFormula(XLCellAddress(row,4) + "*" + XLCellAddress(row,5))
		Next
		
		sheet.Cell(9, 5).SetValue("Total")
		sheet.Cell(9, 6).SetFormula("SUM(F3:F7)")
		
		sheet.Column(1).SetWidth(15)
		
		doc.Save("example1")
	
		OpenURL("example1.xlsx")
		
		Return False
	
	End Method


End Type
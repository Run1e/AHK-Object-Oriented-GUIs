#SingleInstance force
#NoEnv
SetBatchLines -1

OnExit("Exit")

#Include ..\gui\GuiBase.ahk

global MyGui := new ClassGui("test gui", "+Resize +Border -MinimizeBox", func("p"))
MyGui.Show()
return

Class ClassGui extends GuiBase {
	Init() {
		this.MyEdit := this.AddEdit("w200")
		this.AddButton("w200", "Add to the listview!").OnEvent(this.AddEditText.Bind(this))
		
		this.LV := this.AddListView("w200", ["Text"])
		
		this.AddButton("w200", "Print listview").OnEvent(this.PrintListView.Bind(this))
		
		this.Escape := this.Close
	}
	
	AddEditText(Control, EventInfo, Click) {
		this.LV.Add(, this.MyEdit.Text)
		this.MyEdit.Text := ""
	}
	
	PrintListView(Control, EventInfo, Click) {
		Loop % this.LV.RowCount
			Print .= "`n" this.LV.GetText(A_Index)
		
		msgbox % SubStr(Print, 2)
	}
	
	Size(EventInfo, Width, Height) {
		
	}
	
	Close() {
		ExitApp
	}
}

Exit(Reason, Code) {
	MyGui.Destroy()
	MyGui := ""
}
#SingleInstance force
#NoEnv
SetBatchLines -1
#Include Debug.ahk
Debug.Clear()

#Include gui\GuiBase.ahk

MyGui := new GuiBase("Title", "-MinimizeBox")
MyGui.AddButton("w200", "Button Text")
MyGui.Show()


/*
global MyGui := new TestGui("test gui", "+Resize +Border -MinimizeBox", func("p"))
global MyGui2 := new TestGui("test gui", "+Resize +Border -MinimizeBox", func("p"))

MyGui.Show()
MyGui2.Show()

Exit() {
	MyGui.Destroy()
	MyGui := ""
}

Class TestGui extends GuiBase {
	Init() {
		this.AddButton("w200", "click to change title").OnEvent(this.ChangeTitle.Bind(this))
		this.AddButton("w200", "click to make window 500x500").OnEvent(this.500Window.Bind(this))
		this.AddButton("w200", "click to center window").OnEvent(this.CenterWindow.Bind(this))
		
		this.LV := this.AddListView("w200", ["Event", "Row"]).OnEvent(this.ListViewEvent.Bind(this))
		
		this.ExitButton := this.AddButton("w200", "click to destroy and free references").OnEvent(Func("Exit"))
		
		this.SB := this.AddStatusBar()
		this.SB.SetText("Statusbar text", 2)
	}
	
	ChangeTitle() {
		InputBox, NewTitle
		this.Title := NewTitle
	}
	
	ListViewEvent(Control, Event, Row) {
		Control.Insert(1,, Event, Row)
		Loop 2
			Control.ModifyCol(A_Index, "AutoHDR")
	}
	
	500Window() {
		this.Pos.W := 500
		this.Pos.H := 500
	}
	
	CenterWindow() {
		this.Pos.X := A_ScreenWidth / 2 - this.Pos.W / 2
		this.Pos.Y := A_ScreenHeight / 2 - this.Pos.H / 2
	}
	
	Size(EventInfo, Width, Height) {
		this.SB.SetParts(Width / 2, Width / 2)
		this.SB.SetText(EventInfo ", " Width ", " Height, 1)
		
		this.LV.Pos.H := Height - 160
		
		this.ExitButton.Pos.Y := Height - 55
		
		; change width of all buttons
		for Index, Control in this.Controls
			if IsInstance(Control, GuiBase.ButtonControl, GuiBase.ListViewControl)
				Control.Pos.W := Width - 20
	}
	
	Escape() {
		this.Close()
	}
	
	Close() {
		Exit()
	}
}

rc(ptr) {
	count := ObjAddRef(ptr)
	ObjRelease(ptr)
	msgbox % count - 1
}

/*
	; small functional example
	
	global g := new GuiBase("title",, func("p"))
	g.AddButton("w200", "Button!").OnEvent(Func("OnButtonClick"))
	g.Show()
	return
	
	OnButtonClick(Control, Info*) {
		m("Control of type " Control.Type " and hwnd " Control.hwnd " was clicked in Gui with hwnd " Control.Gui.hwnd ".`n`nEvent params:", Info)
	}
*/
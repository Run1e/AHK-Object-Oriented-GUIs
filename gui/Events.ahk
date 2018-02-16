GuiClose(GuiHwnd) {
	if GuiInstance := GuiBase.GetGui(GuiHwnd)
		GuiInstance.Close.Call(GuiInstance)
	
}

GuiEscape(GuiHwnd) {
	if GuiInstance := GuiBase.GetGui(GuiHwnd)
		GuiInstance.Escape.Call(GuiInstance)
	
}

GuiSize(GuiHwnd, EventInfo, Width, Height) {
	if GuiInstance := GuiBase.GetGui(GuiHwnd)
		return GuiInstance.Size.Call(GuiInstance, EventInfo, Width, Height)
}

GuiDropFiles(GuiHwnd, FileArray, CtrlHwnd, X, Y) {
	if GuiInstance := GuiBase.GetGui(GuiHwnd)
		return GuiInstance.DropFiles.Call(GuiInstance, FileArray, CtrlHwnd, X, Y)
}

GuiContextMenu(GuiHwnd, CtrlHwnd, EventInfo, IsRightClick, X, Y) {
	if GuiInstance := GuiBase.GetGui(GuiHwnd)
		return GuiInstance.ContextMenu.Call(GuiInstance, CtrlHwnd, EventInfo, IsRightClick, X, Y)
}

/*
	GuiControlEvent(hwnd, Param*) {
		for hwnd, Gui in GuiBase.Instances {
			for Index, Control in Gui.Controls {
				m((Control.hwnd)+0, hwnd)
				if (Control.hwnd = hwnd) {
					Control.EventFunc.Call(Control, Param*), m(Control)
				}
			}
		}
	}
*/
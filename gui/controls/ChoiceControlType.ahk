Class ChoiceControlType extends GuiBase.ControlType {
	Choose(Item) {
		this.Control("Choose", Item)
	}
	
	ChooseString(String) {
		this.Control("ChooseString", String)
	}
	
	GetSelected() {
		return this.ControlGet()
	}
}
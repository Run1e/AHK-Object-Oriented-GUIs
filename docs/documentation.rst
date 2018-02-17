###############
Documentation
###############


GuiBase
--------

The :class:`GuiBase` class is the main class that represents a GUI.

It can either be instantiated directly, or you can extend upon it for more complicated GUIs. See the :ref:`examples`.


.. data:: GuiBase.__Version

   Contains the installed version of the library.
   
.. function:: GuiBase.GetGui(hwnd)

   :param hwnd: GUI hwnd.
   :return: A :class:`GuiBase` instance, if found.
   
.. class:: GuiBase

  Represents a GUI object.

  .. data:: Title
   
     Get or set the window title.
   
  .. data:: hwnd

     Contains the window handle.
   
  .. data:: ahk_id

     Shorthand for ``"ahk_id" . hwnd``
   
  .. data:: Visible

     Bool indicating whether the window is visible or hidden.
   
  .. data:: BackgroundColor

     Get or set the background color.
   
  .. data:: ControlColor

     Get or set the control (foreground) color.
   
  .. data:: Controls
  
     An array of all control instances the GUI instance has created.
   
  .. data:: Position

     Instance of :class:`GuiBase.WindowPosition` representing the position and size of the GUI window.

  .. function:: __New(Title := "AutoHotkey Window", Options := "")

     Creates a new instance of the class.

     .. note::
	   You shouldn't call this meta-function directly, but use the ``new`` keyword.
	   See the AutoHotkey documentation on `constructing and deconstructing objects <https://autohotkey.com/docs/Objects.htm#Custom_NewDelete>`_.

     :param Title: Title of the window.
     :param Options: Options string.
     :return: A :class:`GuiBase` instance.
   
  .. function:: Show(Options := "")

     Shows the GUI window.
   
     :param Options: Options string.
   
  .. function:: Hide(Options := "")

     Hides the GUI window.

     :param Options: Options string.
   
  .. function:: Destroy(Options := "")

     Destroys the GUI, and all ``GuiBase.ControlType`` instances related to it. All references should be cleared after running this method. 
     It's a good idea to clear all references you have lying around so it can be freed properly.
	
  .. function:: Options(Options)

     Change the options of the GUI.

     :param Options: Options string.
	
  .. function:: SetDefault()

     Sets this GUI as the default GUI.
	
  .. function:: SetDefaultListView(ListView)

     Sets the default ListView control.

     :param ListView: :class:`GuiBase.ListViewControl` instance.
	
  .. function:: Control(Command := "", Control := "", ControlParams := "")

     Calls GuiControl.

     :param Command: The GuiControl command to perform.
	:param Control: The control instance to apply the command on.
	:param ControlParams: The parameters for the command.
	
  .. function:: Margins(x := "", y := "")

     Sets the control spacing margins for newly created controls.

     :param x: Horizontal spacing.
	:param y: Vertical spacing.
	
  .. function:: Font(Options := "", Font := "")

     Changes the font for newly created controls.

     :param Options: Options string.
	:param Font: Font name.
	
  .. function:: Focus()

     Focuses the GUI window.
	
  .. function:: Enable()

     Enables the GUI window if previously disabled.
	
  .. function:: Disable()

     Disables the GUI window if previously enabled.
	
  .. function:: SetIcon(Icon)

     Changes the GUI window icon.
	
	:param Icon: Path to an icon file.
	
  .. function:: AddText(Options := "", Text := "")
  
     Adds a text control.
	
	:param Options: Options string.
	:param Text: Text contents of the control.
	:return: :class:`GuiBase.TextControl` instance.
	
  .. function:: AddButton(Options := "", Text := "")
  
     Adds a text control.
	
	:param Options: Options string.
	:param Text: Text contents of the control.
	:return: :class:`GuiBase.ButtonControl` instance.
	
  .. function:: AddEdit(Options := "", Text := "")
  
     Adds an edit control.
	
	:param Options: Options string.
	:param Text: Text contents of the control.
	:return: :class:`GuiBase.EditControl` instance.
	
  .. function:: AddListView(Options := "", Headers := "")
  
     Adds a ListView control.
	
	:param Options: Options string.
	:param Headers: Either an array of header names, or a string of header names separated by ``|`` (pipe).
	:return: :class:`GuiBase.ListViewControl` instance.
	
  .. function:: AddStatusBar(Options := "", Text := "")
  
     Adds a statusbar.
	
	:param Options: Options string.
	:param Text: Text contents of the control.
	:return: :class:`GuiBase.StatusBarControl` instance.
  
.. currentmodule:: GuiBase






ControlType
--------
   
.. class:: ControlType

  Represents a GUI control object.

  .. data:: Gui
   
     Reference to the GUI instance that created this instance.
	
  .. data:: hwnd
  
     Handle of the control.
	
  .. data:: Position
  
     :class:`GuiBase.ControlPosition` instance.

  .. function:: __New(Gui, Options := "", Text := "")

     Creates a new control instance.
	
	.. note::
	   You shouldn't have to call this yourself, instead use the methods in :class:`GuiBase` to add controls.

     :param Gui: The GUI instance that created this control.
     :param Options: Options string.
	:param Text: Inital text contents of the control, if applicable.
     :return: An indirect reference to the control instance.
	
  .. function:: Options(Options)

     Change the options/settings of the control.
	
	:param Options: Options string.
	
  .. function:: Control(Command := "", Options := "")

     Calls the `GuiControl <https://autohotkey.com/docs/commands/GuiControl.htm>`_ command.
	
	:param Command: The action to do. See documentation link above.
	:param Options: `Param3` in the documentation link above.
	
  .. function:: OnEvent(Func := "")

     Makes the control call ``Func`` when an event happens.
	
     :param Func: Function reference or boundfunc to call when events happen.
	
CommonControlType
-----------------
	
.. class:: CommonControlType

   This class extends :class:`GuiBase.ControlType`

   Represents a control with a text field, such as:
   
   :class:`GuiBase.TextControl`
   
   :class:`GuiBase.ButtonControl`
   
   :class:`GuiBase.EditControl`
   
  .. data:: Text
     
	Get or set the contents of the control.
	
  .. function:: GetText()
  
     :return: The text contents of the control.
	
  .. function:: SetText(Text)
  
     :param Text: New contents of the control.
	
TextControl
-----------

.. class:: TextControl

   This class extends :class:`GuiBase.CommonControlType`
   
ButtonControl
-----------

.. class:: ButtonControl

   This class extends :class:`GuiBase.CommonControlType`
   
EditControl
-----------

.. class:: EditControl

   This class extends :class:`GuiBase.CommonControlType`
   
ListViewControl
-----------

.. class:: ListViewControl

  This class extends :class:`GuiBase.ControlType`

  .. function:: Add(Options := "", Fields*)

     Adds a row to the listview.

     :param Options: Options string.
     :param Fields*: Variadic parameter array of field contents.

  .. function:: Insert(Row, Options := "", Fields*)

    Identical to ``Add()`` but with an additional parameter ``Row``

     :param Row: Which row to insert the new row at.
	
  .. function:: GetCount(Option := "")

     Gets the amount of rows 

     :param Row: Which row to insert the new row at.
	
  .. function:: Insert(Row, Options := "", Fields*)

    Identical to ``Add()`` but with an additional parameter ``Row``

     :param Row: Which row to insert the new row at.
	
  .. function:: Insert(Row, Options := "", Fields*)

    Identical to ``Add()`` but with an additional parameter ``Row``

     :param Row: Which row to insert the new row at.
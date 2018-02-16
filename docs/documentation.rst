###############
Documentation
###############


GuiBase
--------

The :class:`GuiBase` class is the main class that represents a GUI.

It can either be instantiated directly, or you can extend upon it for more complicated GUIs. See the :ref:`examples`.

Library info
~~~~~~~~~~~~

.. data:: GuiBase.__Version

   Contains the installed version of the library.
   

   
.. class:: GuiBase

  Represents a GUI object.

  .. data:: Title
   
     Get or set the window title.
   
  .. data:: hwnd

     Contains the window handle.
   
  .. attribute:: ahk_id

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

     Destroys the GUI, and all ``GuiBase.ControlType`` instances related to it. 
	All references should be cleared after running this method. 
	It's a good idea to clear all references you have lying around so it can be freed properly.
  
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
--------
	
.. class:: CommonControlType

   This class extends on :class:`GuiBase.ControlType`

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
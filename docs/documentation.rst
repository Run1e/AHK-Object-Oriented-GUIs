###############
Documentation
###############


GuiBase
--------

.. class:: GuiBase

The ``GuiBase`` class is the main class that represents a GUI.

It can either be instantiated directly, or you can extend upon it for more complicated GUIs. See the :ref:`examples`.

   .. currentmodule:: GuiBase

Library info
~~~~~~~~~~~~

.. data:: __Version

   Contains the current version of the library.

Attributes and properties
~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
   
.. data:: Position

   Instance of ``GuiBase.WindowPosition`` representing the position and size of the GUI window.

Meta-functions
~~~~~~~~~~~~~~

.. function:: __New(Title := "AutoHotkey Window", Options := "")

   Creates a new instance of the class. Should be called by the ``new`` keyword, not directly.

   :param Title: Title of the window
   :param Options: Options string
   :return: ``GuiBase`` instance
   
Methods
~~~~~~~
   
.. function:: Show(Options := "")

   Shows the GUI window.
   
   :param Options: Options string
   
.. function:: Hide(Options := "")

   Hides the GUI window.

   :param Options: Options string
   
.. function:: Destroy(Options := "")

   Destroys the GUI, and all ``GuiBase.ControlType`` instances related to it. All references should be cleared after running this method. It's a good idea to clear all references to the instance so it can be freed.
   
.. function:: Print(Text)

   Calls the function reference in ``Instance.Debug`` with ``Text``.
   
   Essentially a shorthand for ``Instance.Debug.Call(Text)``

   :param Text: Any string

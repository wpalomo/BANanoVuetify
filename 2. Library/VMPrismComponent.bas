﻿B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8.1
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
Public PrismComponent As VMElement
Public ID As String
Private vue As BANanoVue
Private BANano As BANano  'ignore
Private DesignMode As Boolean
Private Module As Object
Private codeKey As String
End Sub

'initialize the PrismComponent
Public Sub Initialize(v As BANanoVue, sid As String, eventHandler As Object) As VMPrismComponent
ID = sid.tolowercase
	PrismComponent.Initialize(v, ID)
	PrismComponent.SetTag("prism")
	DesignMode = False
	Module = eventHandler
	vue = v
	codeKey =  $"${ID}code"$
	vue.SetStateSingle(codeKey, "")
	Bind(":code", codeKey)
	Return Me
End Sub

'get component
Sub ToString As String
	Return PrismComponent.ToString
End Sub

Sub SetVIf(vif As Object) As VMPrismComponent
PrismComponent.SetVIf(vif)
Return Me
End Sub

Sub SetVShow(vif As Object) As VMPrismComponent
PrismComponent.SetVShow(vif)
Return Me
End Sub

'add to app template
Sub Render
vue.SetTemplate(ToString)
End Sub

'add a child
Sub AddChild(child As VMElement) As VMPrismComponent
Dim childHTML As String = child.ToString
PrismComponent.SetText(childHTML)
Return Me
End Sub

'add to parent
Sub Pop(p As VMElement)
p.SetText(ToString)
End Sub

'add a class
Sub AddClass(c As String) As VMPrismComponent
PrismComponent.AddClass(c)
Return Me
End Sub

'set an attribute
Sub SetAttr(attr As Map) As VMPrismComponent
PrismComponent.SetAttr(attr)
Return Me
End Sub

'set style
Sub SetStyle(sm As Map) As VMPrismComponent
PrismComponent.SetStyle(sm)
Return Me
End Sub

'add children
Sub AddChildren(children As List)
For Each childx As VMElement In children
AddChild(childx)
Next
End Sub

'set code
Sub SetCode(varCode As String) As VMPrismComponent
	vue.SetStateSingle(codeKey, varCode)
	Return Me
End Sub

'set inline
Sub SetInline(varInline As Object) As VMPrismComponent
	Dim pp As String = $"${ID}Inline"$
	vue.SetStateSingle(pp, varInline)
	PrismComponent.Bind(":inline", pp)
	Return Me
End Sub

'set language
Sub SetLanguage(varLanguage As Object) As VMPrismComponent
Dim pp As String = $"${ID}Language"$
vue.SetStateSingle(pp, varLanguage)
PrismComponent.Bind(":language", pp)
Return Me
End Sub


'hide the component
Sub Hide As VMPrismComponent
	PrismComponent.SetVisible(False)
    Return Me
End Sub

'show the component
Sub Show As VMPrismComponent
	PrismComponent.SetVisible(True)
    Return Me
End Sub

'enable the component
Sub Enable As VMPrismComponent
	PrismComponent.Enable(True)
    Return Me
End Sub

'disable the component
Sub Disable As VMPrismComponent
	PrismComponent.Disable(True)
    Return Me
End Sub


'bind a property to state
Sub Bind(prop As String, stateprop As String) As VMPrismComponent
	stateprop = stateprop.ToLowerCase
	SetAttrSingle(prop, stateprop)
	Return Me
End Sub

'add a loose attribute without value
Sub SetAttrLoose(loose As String) As VMPrismComponent
	PrismComponent.SetAttrLoose(loose)
	Return Me
End Sub

'apply a theme to an element
Sub UseTheme(themeName As String) As VMPrismComponent
	themeName = themeName.ToLowerCase
	Dim themes As Map = vue.themes
	If themes.ContainsKey(themeName) Then
		Dim sclass As String = themes.Get(themeName)
		AddClass(sclass)
	End If
	Return Me
End Sub


'set color intensity
Sub SetColorIntensity(varColor As String, varIntensity As String) As VMPrismComponent
	Dim pp As String = $"${ID}Color"$
	Dim scolor As String = $"${varColor} ${varIntensity}"$
	vue.SetStateSingle(pp, scolor)
	PrismComponent.Bind(":color", pp)
	Return Me
End Sub

'remove an attribute
public Sub RemoveAttr(sName As String) As VMPrismComponent
	PrismComponent.RemoveAttr(sName)
	Return Me
End Sub

'set padding
Sub SetPaddingAll(p As String) As VMPrismComponent
	PrismComponent.SetPaddingAll(p)
	Return Me
End Sub

'set all margins
Sub SetMarginAll(p As String) As VMPrismComponent
	PrismComponent.setmarginall(p)
	Return Me
End Sub

'set design mode
Sub SetDesignMode(b As Boolean) As VMPrismComponent
	PrismComponent.SetDesignMode(b)
	DesignMode = b
	Return Me
End Sub

'set tab index
Sub SetTabIndex(ti As String) As VMPrismComponent
	PrismComponent.SetTabIndex(ti)
	Return Me
End Sub

'The Select name. Similar To HTML5 name attribute.
Sub SetName(varName As Object, bbind As Boolean) As VMPrismComponent
	PrismComponent.SetName(varName, bbind)
	Return Me
End Sub

'set single style
Sub SetStyleSingle(prop As String, value As String) As VMPrismComponent
	PrismComponent.SetStyleSingle(prop, value)
	Return Me
End Sub

'set single attribute
Sub SetAttrSingle(prop As String, value As String) As VMPrismComponent
	PrismComponent.SetAttrSingle(prop, value)
	Return Me
End Sub

'set single style
Sub BindStyleSingle(prop As String, value As String) As VMPrismComponent
	PrismComponent.BindStyleSingle(prop, value)
	Return Me
End Sub

Sub SetVElse(vif As String) As VMPrismComponent
	PrismComponent.SetVElse(vif)
	Return Me
End Sub

Sub SetVText(vhtml As String) As VMPrismComponent
	PrismComponent.SetVText(vhtml)
	Return Me
End Sub

Sub SetVhtml(vhtml As String) As VMPrismComponent
	PrismComponent.SetVHtml(vhtml)
	Return Me
End Sub

Sub SetAttributes(attrs As List) As VMPrismComponent
	For Each stra As String In attrs
		SetAttrLoose(stra)
	Next
	Return Me
End Sub

'set for
Sub SetVFor(item As String, dataSource As String) As VMPrismComponent
	dataSource = dataSource.tolowercase
	item = item.tolowercase
	Dim sline As String = $"${item} in ${dataSource}"$
	SetAttrSingle("v-for", sline)
	Return Me
End Sub

Sub SetKey(k As String) As VMPrismComponent
	k = k.tolowercase
	SetAttrSingle(":key", k)
	Return Me
End Sub

'set the row and column position
Sub SetRC(sRow As String, sCol As String) As VMPrismComponent
	PrismComponent.SetRC(sRow, sCol)
	Return Me
End Sub

'set the offsets for this item
Sub SetDeviceOffsets(OS As String, OM As String,OL As String,OX As String) As VMPrismComponent
	PrismComponent.SetDeviceOffsets(OS, OM, OL, OX)
	Return Me
End Sub


'set the position: row and column and sizes
Sub SetDevicePositions(srow As String, scell As String, small As String, medium As String, large As String, xlarge As String) As VMPrismComponent
	SetRC(srow, scell)
	SetDeviceSizes(small,medium, large, xlarge)
	Return Me
End Sub

'set the sizes for this item
Sub SetDeviceSizes(SS As String, SM As String, SL As String, SX As String) As VMPrismComponent
	PrismComponent.SetDeviceSizes(SS, SM, SL, SX)
	Return Me
End Sub


Sub AddComponent(comp As String) As VMPrismComponent
	PrismComponent.SetText(comp)
	Return Me
End Sub


Sub SetTextCenter As VMPrismComponent
	PrismComponent.AddClass("text-center")
	Return Me
End Sub

Sub AddToContainer(pCont As VMContainer, rowPos As Int, colPos As Int)
	pCont.AddComponent(rowPos, colPos, ToString)
End Sub


Sub BuildModel(mprops As Map, mstyles As Map, lclasses As List, loose As List) As VMPrismComponent
PrismComponent.BuildModel(mprops, mstyles, lclasses, loose)
Return Me
End Sub


Sub SetVisible(b As Boolean) As VMPrismComponent
PrismComponent.SetVisible(b)
Return Me
End Sub


'set color intensity
Sub SetTextColor(varColor As String) As VMPrismComponent
	Dim sColor As String = $"${varColor}--text"$
	AddClass(sColor)
	Return Me
End Sub

'set color intensity
Sub SetTextColorIntensity(varColor As String, varIntensity As String) As VMPrismComponent
	Dim sColor As String = $"${varColor}--text"$
	Dim sIntensity As String = $"text--${varIntensity}"$
	Dim mcolor As String = $"${sColor} ${sIntensity}"$
	AddClass(mcolor)
	Return Me
End Sub

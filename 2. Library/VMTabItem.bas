﻿B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=8.1
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public TabItem As VMElement
	Public ID As String
	Private vue As BANanoVue
	Private BANano As BANano  'ignore
	Private DesignMode As Boolean
	Private Module As Object
End Sub

'initialize the TabItem, ensure its same as AddTab
Public Sub Initialize(v As BANanoVue, sid As String, eventHandler As Object) As VMTabItem
	ID = sid.tolowercase
	TabItem.Initialize(v, ID)
	TabItem.SetTag("v-tab-item")
	DesignMode = False
	Module = eventHandler
	vue = v
	SetAttrSingle("key", ID)
	TabItem.SetValue(ID, False)
	Return Me
End Sub


Sub AddComponent(comp As String) As VMTabItem
	TabItem.SetText(comp)
	Return Me
End Sub

Sub SetAttrLoose(loose As String) As VMTabItem
	TabItem.SetAttrLoose(loose)
	Return Me
End Sub

Sub SetAttributes(attrs As List) As VMTabItem
	For Each stra As String In attrs
		SetAttrLoose(stra)
	Next
	Return Me
End Sub

'get component
Sub ToString As String
	Return TabItem.ToString
End Sub

Sub SetVModel(k As String) As VMTabItem
	TabItem.SetVModel(k)
	Return Me
End Sub

Sub SetVIf(vif As Object) As VMTabItem
	TabItem.SetVIf(vif)
	Return Me
End Sub

Sub SetVShow(vif As Object) As VMTabItem
	TabItem.SetVShow(vif)
	Return Me
End Sub

'add to app template
Sub Render
	vue.SetTemplate(ToString)
End Sub

'add a child
Sub AddChild(child As VMElement) As VMTabItem
	Dim childHTML As String = child.ToString
	TabItem.SetText(childHTML)
	Return Me
End Sub

'set text
Sub SetText(t As Object) As VMTabItem
	TabItem.SetText(t)
	Return Me
End Sub

'add to parent
Sub Pop(p As VMElement)
	p.SetText(ToString)
End Sub

'add a class
Sub AddClass(c As String) As VMTabItem
	TabItem.AddClass(c)
	Return Me
End Sub

'set an attribute
Sub SetAttr(attr As Map) As VMTabItem
	TabItem.SetAttr(attr)
	Return Me
End Sub

'set style
Sub SetStyle(sm As Map) As VMTabItem
	TabItem.SetStyle(sm)
	Return Me
End Sub

'add children
Sub AddChildren(children As List)
	For Each childx As VMElement In children
		AddChild(childx)
	Next
End Sub

'set active-class
Sub SetActiveClass(varActiveClass As Object) As VMTabItem
	Dim pp As String = $"${ID}ActiveClass"$
	vue.SetStateSingle(pp, varActiveClass)
	TabItem.Bind(":active-class", pp)
	Return Me
End Sub

'set disabled
Sub SetDisabled(varDisabled As Boolean) As VMTabItem
	TabItem.SetDisabled(varDisabled)
	Return Me
End Sub

'set eager
Sub SetEager(varEager As Object) As VMTabItem
	Dim pp As String = $"${ID}Eager"$
	vue.SetStateSingle(pp, varEager)
	TabItem.Bind(":eager", pp)
	Return Me
End Sub

'set id
Sub SetId(varId As Object) As VMTabItem
	Dim pp As String = $"${ID}Id"$
	vue.SetStateSingle(pp, varId)
	TabItem.Bind(":id", pp)
	Return Me
End Sub

'set reverse-transition
Sub SetReverseTransition(varReverseTransition As Object) As VMTabItem
	Dim pp As String = $"${ID}ReverseTransition"$
	vue.SetStateSingle(pp, varReverseTransition)
	TabItem.Bind(":reverse-transition", pp)
	Return Me
End Sub

'set transition
Sub SetTransition(varTransition As Object) As VMTabItem
	Dim pp As String = $"${ID}Transition"$
	vue.SetStateSingle(pp, varTransition)
	TabItem.Bind(":transition", pp)
	Return Me
End Sub

'set value
Sub SetValue(varValue As Object) As VMTabItem
	TabItem.SetValue(varValue, False)
	Return Me
End Sub


Sub Hide As VMTabItem
	TabItem.SetVisible(False)
	Return Me
End Sub

Sub Show As VMTabItem
	TabItem.SetVisible(True)
	Return Me
End Sub

Sub Enable As VMTabItem
	TabItem.Enable(True)
	Return Me
End Sub

Sub Disable As VMTabItem
	TabItem.Disable(True)
	Return Me
End Sub


'bind a property to state
Sub Bind(prop As String, stateprop As String) As VMTabItem
	stateprop = stateprop.ToLowerCase
	SetAttrSingle(prop, stateprop)
	Return Me
End Sub


public Sub RemoveAttr(sName As String) As VMTabItem
	TabItem.RemoveAttr(sName)
	Return Me
End Sub

'set padding
Sub SetPaddingAll(p As String) As VMTabItem
	TabItem.SetPaddingAll(p)
	Return Me
End Sub

Sub SetMarginAll(p As String) As VMTabItem
	TabItem.setmarginall(p)
	Return Me
End Sub

Sub SetDesignMode(b As Boolean) As VMTabItem
	TabItem.SetDesignMode(b)
	DesignMode = b
	Return Me
End Sub

Sub SetTabIndex(ti As String) As VMTabItem
	TabItem.SetTabIndex(ti)
	Return Me
End Sub

'The Select name. Similar To HTML5 name attribute.
Sub SetName(varName As Object, bbind As Boolean) As VMTabItem
	TabItem.SetName(varName, bbind)
	Return Me
End Sub


Sub SetStyleSingle(prop As String, value As String) As VMTabItem
	TabItem.SetStyleSingle(prop, value)
	Return Me
End Sub

Sub SetAttrSingle(prop As String, value As String) As VMTabItem
	TabItem.SetAttrSingle(prop, value)
	Return Me
End Sub

Sub BuildModel(mprops As Map, mstyles As Map, lclasses As List, loose As List) As VMTabItem
TabItem.BuildModel(mprops, mstyles, lclasses, loose)
Return Me
End Sub
Sub SetVisible(b As Boolean) As VMTabItem
TabItem.SetVisible(b)
Return Me
End Sub

'set color intensity
Sub SetTextColor(varColor As String) As VMTabItem
	Dim sColor As String = $"${varColor}--text"$
	AddClass(sColor)
	Return Me
End Sub

'set color intensity
Sub SetTextColorIntensity(varColor As String, varIntensity As String) As VMTabItem
	Dim sColor As String = $"${varColor}--text"$
	Dim sIntensity As String = $"text--${varIntensity}"$
	Dim mcolor As String = $"${sColor} ${sIntensity}"$
	AddClass(mcolor)
	Return Me
End Sub
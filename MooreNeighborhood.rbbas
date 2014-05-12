#tag Class
Protected Class MooreNeighborhood
	#tag Method, Flags = &h0
		Sub Constructor(ByRef World(,) As Integer, X As Integer, Y As Integer)
		  ReDim Neighbors(2, 2)
		  For i As Integer = -1 To 1
		    For j As Integer = -1 To 1
		      Neighbors(i + 1, j + 1) = World(X + i, Y + j)
		    Next
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NeighborCount() As Integer
		  Return Operator_Subscript(-1, -1) + Operator_Subscript(0, -1) + Operator_Subscript(1, -1) + Operator_Subscript(1, 0) + Operator_Subscript(1, 1) + Operator_Subscript(0, 1) + Operator_Subscript(-1, 1) + Operator_Subscript(-1, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subscript(i As Integer, j As Integer) As Integer
		  Return Neighbors(i + 1, j + 1)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Neighbors(-1,-1) As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

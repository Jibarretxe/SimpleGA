#tag Class
Protected Class clsIndividual
	#tag Method, Flags = &h1
		Protected Function Clone() As clsIndividual
		  dim ClonedIndividual as new clsIndividual(me.X, me.Y)
		  Return ClonedIndividual
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Crossover(OtherParent as clsIndividual)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Evaluate()
		  me.Value=me.X^3+3*me.Y^2-5*me.X*me.Y+100
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Mutate()
		  dim r as Random
		  
		  me.X=round(me.X+r.InRange(-100,100)/100*MutationRate)
		  me.Y=round(me.Y+r.InRange(-100,100)/100*MutationRate)
		  
		  if me.X>RangeX then
		    me.X=round(RangeX*r.InRange(0,100)/100)
		  end if
		  
		  if me.Y>RangeY then
		    me.Y=round(RangeY*r.InRange(0,100)/100)
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Value As Int64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private X As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Y As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

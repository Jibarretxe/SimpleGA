#tag Class
Protected Class clsIndividual
	#tag Method, Flags = &h0
		Function Clone() As clsIndividual
		  dim ClonedIndividual as new clsIndividual(me.X, me.Y)
		  Return ClonedIndividual
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(optional Xdef as Integer, optional Ydef as Integer)
		  'If Xdef and Ydef are 0 it means we are creating a new (random) individual
		  'If Xdef or Ydef are not 0 then we are cloning an existing individual
		  
		  
		  If (Xdef+Ydef)>0 then
		    me.X=Xdef
		    me.Y=Ydef
		  else
		    Dim r as new Random
		    r.seed=Microseconds
		    me.X=r.InRange(0,RangeX)
		    me.Y=r.InRange(0,RangeY)
		  end if
		  
		  me.Evaluate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Crossover(OtherParent as clsIndividual) As clsIndividual
		  'This method will create a new individual take one value from each of the parents
		  dim r as new Random
		  r.seed=Microseconds
		  Dim Xcrossed, Ycrossed as Integer
		  
		  if r.InRange(0,100)>50 then
		    Xcrossed=me.X
		    Ycrossed=OtherParent.Y
		  else
		    Xcrossed=OtherParent.X
		    Ycrossed=me.Y
		  end if
		  
		  Dim CrossedIndividual as new clsIndividual(Xcrossed,Ycrossed)
		  
		  Return CrossedIndividual
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Evaluate()
		  me.Value=me.X^3+3*me.Y^2-5*me.X*me.Y+100
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Mutate()
		  Dim r as new random
		  r.seed=Microseconds
		  me.X=round(me.X+r.InRange(-100,100)/100*MutationRate)
		  me.Y=round(me.Y+r.InRange(-100,100)/100*MutationRate)
		  
		  if me.X>RangeX then
		    me.X=round(RangeX*r.InRange(0,100)/100)
		  end if
		  
		  if me.Y>RangeY then
		    me.Y=round(RangeY*r.InRange(0,100)/100)
		  end if
		  
		  me.Evaluate
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Value As Int64
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

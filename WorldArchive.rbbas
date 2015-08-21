#tag Class
Protected Class WorldArchive
	#tag Method, Flags = &h0
		Function AppendWorldState(WorldName As String, WorldState As String) As Boolean
		  Dim world As FolderItem = Root.Child(WorldName)
		  If Not world.Exists Or Not world.Directory Then Return False
		  Dim item As FolderItem = world.Child(Format(world.Count, "0000000000000000000000000000000#"))
		  Dim bs As BinaryStream = BinaryStream.Create(item, True)
		  bs.Write(WorldState)
		  bs.Close
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateWorld(WorldName As String) As Boolean
		  Dim world As FolderItem = Root.Child(WorldName)
		  Select Case True
		  Case world.Exists And world.Directory
		    Return True
		  Case world.Exists And Not world.Directory
		    Return False
		  Else
		    world.CreateAsFolder
		    mVolume.Flush
		    Return world.Exists And world.Directory
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadWorldState(WorldName As String, StateIndex As Integer) As String
		  Dim world As FolderItem = Root.Child(WorldName)
		  If Not world.Exists Or Not world.Directory Then Raise New OutOfBoundsException
		  Dim item As FolderItem = world.Child(Format(StateIndex, "0000000000000000000000000000000#"))
		  Dim bs As BinaryStream = BinaryStream.Open(item)
		  Dim data As String = bs.Read(bs.Length)
		  bs.Close
		  Return data
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Root() As FolderItem
		  Return mVolume.Root
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StateCount(WorldName As String) As Integer
		  Dim world As FolderItem = Root.Child(WorldName)
		  If Not world.Exists Or Not world.Directory Then Return -1
		  Return world.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WorldCount() As Integer
		  Return Root.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WorldName(Index As Integer) As String
		  Dim world As FolderItem = Root.Item(Index)
		  If Not world.Exists Or Not world.Directory Then Raise New OutOfBoundsException
		  Return world.Name
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mVolume As VirtualVolume
	#tag EndProperty

	#tag Property, Flags = &h21
		Private WriteBuffer() As Pair
	#tag EndProperty


End Class
#tag EndClass

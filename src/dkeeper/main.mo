import List "mo:base/List";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor DKeeper {

  public type Note = {
    // new datatype
    title : Text;
    content : Text;
  };

  stable var notes : List.List<Note> = List.nil<Note>();

  public func createNote(titleText : Text, contentText : Text) {
    // CREATE OPERATION

    let newNote : Note = {
      title = titleText;
      content = contentText;
    };

    notes := List.push(newNote, notes);
    Debug.print(debug_show (notes));
  };

  public query func readNote() : async [Note] {
    // READ OPERATION
    return List.toArray(notes);
  };

  public func removeNote(id : Nat) {

    let notesFront = List.take(notes, id);
    notes := List.drop(notes, id +1);
    notes := List.append(notesFront, notes);

  };
};

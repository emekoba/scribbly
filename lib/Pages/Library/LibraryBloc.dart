import "package:bloc/bloc.dart";

enum counterEvents { increment, decrement }

class LibraryBloc extends Bloc<counterEvents, int> {
  LibraryBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(counterEvents event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}

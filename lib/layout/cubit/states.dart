abstract class AppStates {}

class InitialState extends AppStates {}

class ChangeNavBarState extends AppStates {}

class ChangeCategoryState extends AppStates {}
class ChangeforumsState extends AppStates {}

class AddCountState extends AppStates {}

class MinusCountState extends AppStates {}

class AddToSearchListState extends AppStates {}

class LoadingGetUserState extends AppStates {}

class SuccessGetUserState extends AppStates {}

class ErrorGetUserState extends AppStates {
  final String error;

  ErrorGetUserState(this.error);
}

class LoadingGetProductState extends AppStates {}

class SuccessGetProductState extends AppStates {}

class ErrorGetProductState extends AppStates {
  final String error;

  ErrorGetProductState(this.error);
}

class LoadingGetForumsState extends AppStates {}

class SuccessGetForumsState extends AppStates {}

class ErrorGetForumsState extends AppStates {
  final String error;

  ErrorGetForumsState(this.error);
}

class LoadingGetMyForumsState extends AppStates {}

class SuccessGetMyForumsState extends AppStates {}

class ErrorGetMyForumsState extends AppStates {
  final String error;

  ErrorGetMyForumsState(this.error);
}

class PostImageSuccessState extends AppStates {}

class PostImageErrorState extends AppStates {}

class LoadingAddPostState extends AppStates {}

class SuccessAddPostState extends AppStates {}

class ErrorAddPostState extends AppStates {}

class RemovePostImageState extends AppStates {}

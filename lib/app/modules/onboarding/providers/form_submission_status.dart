

abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {}

class SubmissionSuccess extends FormSubmissionStatus {}

class PasswordCharacters extends FormSubmissionStatus {
}
class PasswordCharactersFailed extends FormSubmissionStatus {}
class PasswordSpecialCharacter extends FormSubmissionStatus {}
class PasswordSpecialCharacterFailed extends FormSubmissionStatus {}

class PasswordNumber extends FormSubmissionStatus {}
class PasswordNumberFailed extends FormSubmissionStatus {}

class SubmissionFailed extends FormSubmissionStatus {
  final String exception;

  SubmissionFailed(this.exception);
}
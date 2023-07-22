// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class FormSubmitionStatus {
  const FormSubmitionStatus();
}

class InitialFormStatus extends FormSubmitionStatus {
  const InitialFormStatus();
}

class FormSubmiting extends FormSubmitionStatus {}

class SubmittionSuccess extends FormSubmitionStatus {}

class SubmitionFailed extends FormSubmitionStatus {
  final dynamic exception;
  SubmitionFailed(this.exception);
}

abstract class AbsenceStates{}
class AbsenceInitialState extends AbsenceStates{}


/////       Get Absence       /////////////
class GetAbsenceLoadingState extends AbsenceStates{}
class GetAbsenceErrorState extends AbsenceStates{
  final String error;
  GetAbsenceErrorState(this.error);
}
class GetAbsenceSuccessState extends AbsenceStates{}

class UpdateStudentAbsenceLoadingState extends AbsenceStates{}
class UpdateStudentAbsenceErrorState extends AbsenceStates{
  final String error;
  final int studentId;
  UpdateStudentAbsenceErrorState(this.error, this.studentId, );
}
class UpdateStudentAbsenceSuccessState extends AbsenceStates{}

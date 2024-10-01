part of 'counter_bloc.dart';

abstract class CounterEvent {}

final class CounterIncremented extends CounterEvent {}

final class CounterDecremented extends CounterEvent {}


/*
!why were the subclasses made final?
?we are using final before the subclasses because we do not want to use them outsidee of this library/file.

!why are we using 'part of...' and 'part...' as the import statement?
? We need the events to be in the same file as the bloc, but that is not a good practice when we handle huge code bases, hence we use 'part of "parent_file.dart"' for the children files and 'part "child_file.dart"' for the parent file. This simply says that these are 2 different files but represent a single library (considered as a single unit of code).
 */
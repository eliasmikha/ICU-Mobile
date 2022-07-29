enum GenderEnum {
  Male,
  Female,
  Other,
}

int mapGenderToInt(GenderEnum? gender) {
  switch (gender) {
    case GenderEnum.Male:
      return 1;
    case GenderEnum.Female:
      return 2;
    case GenderEnum.Other:
      return 3;
    default:
      return 3;
  }
}

GenderEnum mapIntToGender(int? value) {
  switch (value) {
    case 1:
      return GenderEnum.Male;
    case 2:
      return GenderEnum.Female;
    case 3:
      return GenderEnum.Other;
    default:
      return GenderEnum.Other;
  }
}

String getStringFromGender(GenderEnum? gender) {
  switch (gender) {
    case GenderEnum.Male:
      return "Male";
    case GenderEnum.Female:
      return "Female";
    case GenderEnum.Other:
      return "Other";
    default:
      return "Other";
  }
}

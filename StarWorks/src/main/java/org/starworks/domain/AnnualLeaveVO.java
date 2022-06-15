package org.starworks.domain;

import lombok.Data;

@Data
public class AnnualLeaveVO{
    int an_no;
    int e_no;
    int an_distinct;
    double an_deduction;
    String an_startDate;
    String an_endDate;
    String an_acknowledge;

}

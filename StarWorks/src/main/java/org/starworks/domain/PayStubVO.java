package org.starworks.domain;

import lombok.Data;

import static java.lang.Math.round;

@Data
public class PayStubVO{
    final int mealAllowance = 200000;
    final double incomeTaxRate = 0.0283;
    final double inhabitantsTaxRate = 0.0028;
    final double nationalPensionRate = 0.045;
    final double employmentInsuranceRate = 0.008;
    final double healthInsuranceRate = 0.0343;

    int incomeTax;
    int inhabitantsTax;
    int nationalPension;
    int employmentInsurance;
    int healthInsurance;

    int p_no;
    int e_no;
    String p_date;

    int p_basePay;
    int p_NetPay;

    public PayStubVO() {
    }

    public PayStubVO(int nextP_no, int e_no, String p_date, int p_basePay) {
        this.p_no = nextP_no;
        this.e_no = e_no;
        this.p_date = p_date;
        this.p_basePay = p_basePay;
    }

    public void makeDetail() {

        this.incomeTax = (int) (p_basePay * incomeTaxRate);
        this.inhabitantsTax = (int) (p_basePay * inhabitantsTaxRate);
        this.nationalPension = (int) (p_basePay * nationalPensionRate);
        this.employmentInsurance = (int) (p_basePay * employmentInsuranceRate);
        this.healthInsurance =  (int) (p_basePay * healthInsuranceRate);
        double p_basePayBuf = p_basePay
                - (incomeTax + inhabitantsTax + nationalPension + employmentInsurance + healthInsurance)
                + mealAllowance;
        
        //십원까지만 출력
        
        p_basePayBuf /= 10;
        p_basePayBuf = round(p_basePayBuf);
        p_basePayBuf *= 10;
        this.p_NetPay = (int) p_basePayBuf;
    }

}

package com.DuAn.dentistApp.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer postId ;

    private  String image ;

    private  String title ;

    private  String body ;

    private boolean isDeleted = false;

    @Temporal(TemporalType.DATE)
    private Date createDate;

    @ManyToOne()
    @JoinColumn(name = "dentalStaffId")
    private  DentalStaff createBy;
}

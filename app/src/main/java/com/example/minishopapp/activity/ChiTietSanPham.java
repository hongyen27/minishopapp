package com.example.minishopapp.activity;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;
import androidx.appcompat.widget.Toolbar;

import com.example.minishopapp.R;
import com.example.minishopapp.model.Giohang;
import com.example.minishopapp.model.Sanpham;
import com.squareup.picasso.Picasso;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class ChiTietSanPham extends AppCompatActivity {
    Toolbar toolbarchitiet;
    ImageView imageViewchitet;
    TextView txtten,txtgia,txtmota;
    Spinner spinner;
    Button btndatmua;
    int id=0;
    String Tenchitiet="";
    int Giachitiet=0;
    String Hinhanhchitieet="";
    String Motachitiet="";
    int Idloaisanpham=0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_chi_tiet_san_pham);
        Anhxa();
        ActionToolBar();
        GetInformation();
        CatchEventSpinner();
        EventButton();
    }

    private void EventButton() {
        btndatmua.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(MainActivity.manggiohang.size()<=0){
                    int soluong = Integer.parseInt(spinner.getSelectedItem().toString());
                    long giamoi=soluong*Giachitiet;
                    MainActivity.manggiohang.add(new Giohang(id,Tenchitiet,giamoi,Hinhanhchitieet,soluong));
                }else{
                    boolean exists=false;
                    int sl= Integer.parseInt(spinner.getSelectedItem().toString());
                    for(int i=0;i<MainActivity.manggiohang.size();i++){
                        if(MainActivity.manggiohang.get(i).getIdsp()==id){
                            MainActivity.manggiohang.get(i).setSoluongsp(MainActivity.manggiohang.get(i).getSoluongsp()+sl);
                            if(MainActivity.manggiohang.get(i).getSoluongsp()>10){
                                MainActivity.manggiohang.get(i).setSoluongsp(10);
                            }
                            MainActivity.manggiohang.get(i).setGiasp(Giachitiet*(MainActivity.manggiohang.get(i).getSoluongsp()));
                            exists=true;
                        }
                    }
                    if(exists==false){
                        int soluong = Integer.parseInt(spinner.getSelectedItem().toString());
                        long giamoi=soluong*Giachitiet;
                        MainActivity.manggiohang.add(new Giohang(id,Tenchitiet,giamoi,Hinhanhchitieet,soluong));
                    }
                }
                Intent intent=new Intent(getApplicationContext(),GiohangActivity.class);
                startActivity(intent);
            }
        });
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu,menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        switch (item.getItemId()){
            case R.id.menugiohang:
                Intent intent=new Intent(getApplicationContext(),GiohangActivity.class);
                startActivity(intent);
        }
        return super.onOptionsItemSelected(item);
    }


    private void CatchEventSpinner() {
        Integer[] soluong=new Integer[]{1,2,3,4,5,6,7,8,9,10};
        ArrayAdapter<Integer> arrayadapter=new ArrayAdapter<Integer>(this,android.R.layout.simple_spinner_dropdown_item,soluong);
        spinner.setAdapter(arrayadapter);
    }

    private void GetInformation() {
        Sanpham sanpham= (Sanpham) getIntent().getSerializableExtra("thongtinsanpham");
        id = sanpham.getId();
        Tenchitiet=sanpham.getName();
        Giachitiet=sanpham.getPrice();
        Hinhanhchitieet=sanpham.getImageUrl();
        Motachitiet=sanpham.getDescription();
        Idloaisanpham=sanpham.getCategoryId();
        txtten.setText(Tenchitiet);
        DecimalFormat decimalFormat=new DecimalFormat("###,###,###");
        txtgia.setText("Giá: "+decimalFormat.format(Giachitiet)+"Đ");
        txtmota.setText(Motachitiet);
        Picasso.with(getApplicationContext()).load(Hinhanhchitieet).placeholder(R.drawable.noimage).error(R.drawable.category).into(imageViewchitet);
    }

    private void ActionToolBar() {
        setSupportActionBar(toolbarchitiet);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbarchitiet.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }

    private void Anhxa() {
        toolbarchitiet=findViewById(R.id.toolbarchitietsanpham);
        imageViewchitet=findViewById(R.id.imageviewchitietsp);
        txtten=findViewById(R.id.textviewtenchitietp);
        txtgia=findViewById(R.id.textviewgiachitietp);
        txtmota=findViewById(R.id.textviewmotachitietsp);
        spinner=findViewById(R.id.spinner);
        btndatmua=findViewById(R.id.buttondatmua);
    }
}
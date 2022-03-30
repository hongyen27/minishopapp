package com.example.minishopapp.activity;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.minishopapp.R;
import com.example.minishopapp.util.CheckConnection;
import com.example.minishopapp.util.Server;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class ThongTinActivity extends AppCompatActivity {
    EditText edttenkhachhang,edtsdt,edtdiachi;
    Button btnxacnhan,btntrove;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_thong_tin);
        Anhxa();
        btntrove.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        if(CheckConnection.haveNetworkConnection(getApplicationContext())){
            Eventbutton();
        }else{
            CheckConnection.ShowToast_Short(getApplicationContext(),"Bạn hãy kiểm tra kết nối");
        }
    }

    private void Eventbutton() {
        btnxacnhan.setOnClickListener(new View.OnClickListener() {
           Random random=new Random();
           int idmagiohang=random.nextInt(2000000000);
            @Override
            public void onClick(View v) {
                String hoten= edttenkhachhang.getText().toString().trim();
                String sdt =edtsdt.getText().toString().trim();
                String address =edtdiachi.getText().toString().trim();
                RequestQueue requestQueue =Volley.newRequestQueue(getApplicationContext());
                JsonObjectRequest jsonObjectRequest= null;
                for (int i=0;i<MainActivity.manggiohang.size();i++)
                {
                    JSONObject jsonObject=new JSONObject();
                    try {
                        jsonObject.put("id",idmagiohang);
                        jsonObject.put("productId", MainActivity.manggiohang.get(i).getIdsp());
                        jsonObject.put("productName",MainActivity.manggiohang.get(i).getTensp());
                        jsonObject.put("price", MainActivity.manggiohang.get(i).getGiasp());
                        jsonObject.put("quantity", MainActivity.manggiohang.get(i).getSoluongsp());
                        jsonObject.put("imageUrl",MainActivity.manggiohang.get(i).getHinhsp());
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    try {
                        jsonObjectRequest = new JsonObjectRequest (Server.Duongdanchitietdonhang, new JSONObject(String.valueOf(jsonObject)), new Response.Listener<JSONObject>() {
                            @Override
                            public void onResponse(JSONObject response) {

                            }
                        }, new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                Log.d("loi",error.toString());
                            }
                        });
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                    requestQueue.add(jsonObjectRequest);
                }
                JSONObject json=new JSONObject();
                try {
                    json.put("id",idmagiohang);
                    json.put("notes",hoten);
                    json.put("sdt",sdt);
                    json.put("address",address);
                } catch (JSONException e) {
                    e.printStackTrace();
                }
                try {
                    jsonObjectRequest= new JsonObjectRequest (Server.Duongdandonhang, new JSONObject(String.valueOf(json)), new Response.Listener<JSONObject>() {
                        @Override
                        public void onResponse(JSONObject response) {

                        }
                    }, new Response.ErrorListener() {
                        @Override
                        public void onErrorResponse(VolleyError error) {

                        }
                    });
                } catch (JSONException e) {
                    e.printStackTrace();
                }
                requestQueue.add(jsonObjectRequest);

                MainActivity.manggiohang.clear();
                Intent intent=new Intent(getApplicationContext(),MainActivity.class);
                startActivity(intent);
                CheckConnection.ShowToast_Short(getApplicationContext(),"Đặt hàng thành công");

            }

        });
        }

    private void Anhxa() {
        edttenkhachhang=findViewById(R.id.edittexttenkhaschhaang);
        edtdiachi=findViewById(R.id.edittextdiachikhaschhaang);
        edtsdt=findViewById(R.id.edittextsodienthoai);
        btntrove=findViewById(R.id.buttontrove);
        btnxacnhan=findViewById(R.id.buttonxacnhan);
    }
}
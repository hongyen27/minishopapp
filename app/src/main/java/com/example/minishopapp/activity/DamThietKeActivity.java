package com.example.minishopapp.activity;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.minishopapp.R;
import com.example.minishopapp.adapter.DamthietkeAdapter;
import com.example.minishopapp.model.Sanpham;
import com.example.minishopapp.util.CheckConnection;
import com.example.minishopapp.util.Server;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class DamThietKeActivity extends AppCompatActivity {
    Toolbar toolbardtk;
    ListView lvdtk;
    DamthietkeAdapter damthietkeAdapter;
    ArrayList<Sanpham> mangdtk;
    int iddtk=0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dam_thiet_ke);
        Anhxa();
        if(CheckConnection.haveNetworkConnection(getApplicationContext())){
            GetIdloaisp();
            ActionToolbar();
            GetData(iddtk);
            LoadMoreData();
        }else{
            CheckConnection.ShowToast_Short(getApplicationContext(),"Bạn hãy kiểm tra lại internet");
            finish();
        }

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

    private void LoadMoreData() {
        lvdtk.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent intent=new Intent(getApplicationContext(),ChiTietSanPham.class);
                intent.putExtra("thongtinsanpham",mangdtk.get(position));
                startActivity(intent);
            }
        });
    }

    private void GetData(int Iddtk) {
        RequestQueue requestQueue= Volley.newRequestQueue(getApplicationContext());
        String Duongdan = Server.Duongdandamthietke+ String.valueOf(Iddtk);
        StringRequest stringRequest=new StringRequest(Request.Method.GET,Duongdan, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                int id =0;
                String Tendtk="";
                int Giadtk=0;
                String Hinhanhdtk="";
                String Motadtk ="";
                int idloaispdtk=0;
                if(response!=null){
                    try {
                        JSONArray jsonArray=new JSONArray(response);
                        for (int i=0;i<jsonArray.length();i++){
                            JSONObject jsonObject=jsonArray.getJSONObject(i);
                            id = jsonObject.getInt("id");
                            Tendtk=jsonObject.getString("name");
                            Giadtk=jsonObject.getInt("price");
                            Hinhanhdtk=jsonObject.getString("imageUrl");
                            Motadtk=jsonObject.getString("description");
                            idloaispdtk=jsonObject.getInt("categoryId");
                            mangdtk.add(new Sanpham(id,Tendtk,Giadtk,Hinhanhdtk,Motadtk,idloaispdtk));
                            damthietkeAdapter.notifyDataSetChanged();
                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }

                }

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
            }
        });
        requestQueue.add(stringRequest);
    }

    private void ActionToolbar() {
        setSupportActionBar(toolbardtk);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbardtk.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }

    private void GetIdloaisp() {
        iddtk=getIntent().getIntExtra("idloaisanpham",-1);
        Log.d("giatriloaisanpham",iddtk+"");
    }

    private void Anhxa() {
        toolbardtk = findViewById(R.id.toolbardamthietke);
        lvdtk=findViewById(R.id.listviewdamthietke);
        mangdtk=new ArrayList<>();
        damthietkeAdapter=new DamthietkeAdapter(getApplicationContext(),mangdtk);
        lvdtk.setAdapter(damthietkeAdapter);
    }
}
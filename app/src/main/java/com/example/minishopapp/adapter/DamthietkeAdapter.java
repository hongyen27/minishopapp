package com.example.minishopapp.adapter;

import android.content.Context;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.minishopapp.R;
import com.example.minishopapp.model.Sanpham;
import com.squareup.picasso.Picasso;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class DamthietkeAdapter extends BaseAdapter {
    Context context;
    ArrayList<Sanpham> arraydamthietke;

    public DamthietkeAdapter(Context context, ArrayList<Sanpham> arraydamthietke) {
        this.context = context;
        this.arraydamthietke = arraydamthietke;
    }

    @Override
    public int getCount() {
        return arraydamthietke.size();
    }

    @Override
    public Object getItem(int position) {
        return arraydamthietke.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    public class ViewHolder{
        public TextView txttendamthietke,txtgiadamthietke,txtmotadamthietke;
        public ImageView imgdamthietke;

    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder viewHolder=null;
        if (convertView==null){
            viewHolder=new ViewHolder();
            LayoutInflater inflater= (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            convertView=inflater.inflate(R.layout.dong_damthietke,null);
            viewHolder.txttendamthietke=convertView.findViewById(R.id.textviewdamthietke);
            viewHolder.txtgiadamthietke=convertView.findViewById(R.id.textviewgiadamthietke);
            viewHolder.txtmotadamthietke=convertView.findViewById(R.id.textviewmotadamthietke);
            viewHolder.imgdamthietke=convertView.findViewById(R.id.imageviewdamthietke);
            convertView.setTag(viewHolder);
        }else{
            viewHolder= (ViewHolder) convertView.getTag();
        }
        Sanpham sanpham= (Sanpham) getItem(position);
        viewHolder.txttendamthietke.setText(sanpham.getName());
        DecimalFormat decimalFormat =new DecimalFormat("###,###,###");
        viewHolder.txtgiadamthietke.setText("Giá:"+decimalFormat.format(sanpham.getPrice())+"Đ");
        viewHolder.txtmotadamthietke.setMaxLines(2);
        viewHolder.txtmotadamthietke.setEllipsize(TextUtils.TruncateAt.END);
        viewHolder.txtmotadamthietke.setText(sanpham.getDescription());
        Picasso.with(context).load(sanpham.getImageUrl()).placeholder(R.drawable.noimage).error(R.drawable.category).into(viewHolder.imgdamthietke);
        return convertView;
    }
}

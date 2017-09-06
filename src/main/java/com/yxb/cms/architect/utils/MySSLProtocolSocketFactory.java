/**
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
 *
 * Copyright 2017 © yangxiaobing, 873559947@qq.com
 *
 * This file is part of contentManagerSystem.
 * contentManagerSystem is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * contentManagerSystem is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with contentManagerSystem.  If not, see <http://www.gnu.org/licenses/>.
 *
 * 这个文件是contentManagerSystem的一部分。
 * 您可以单独使用或分发这个文件，但请不要移除这个头部声明信息.
 * contentManagerSystem是一个自由软件，您可以自由分发、修改其中的源代码或者重新发布它，
 * 新的任何修改后的重新发布版必须同样在遵守GPL3或更后续的版本协议下发布.
 * 关于GPL协议的细则请参考COPYING文件，
 * 您可以在contentManagerSystem的相关目录中获得GPL协议的副本，
 * 如果没有找到，请连接到 http://www.gnu.org/licenses/ 查看。
 *
 * - Author: yangxiaobing
 * - Contact: 873559947@qq.com
 * - License: GNU Lesser General Public License (GPL)
 * - source code availability: http://git.oschina.net/yangxiaobing_175/contentManagerSystem
 */
package com.yxb.cms.architect.utils;

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.UnknownHostException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.SocketFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.commons.httpclient.ConnectTimeoutException;
import org.apache.commons.httpclient.params.HttpConnectionParams;
import org.apache.commons.httpclient.protocol.ProtocolSocketFactory;

/**
 * HTTPS 绕开证书验证
 *
 * @author yangxiaobing
 * @date 2017/9/6
 */
public class MySSLProtocolSocketFactory implements ProtocolSocketFactory {

  private SSLContext sslcontext = null;

  private SSLContext createSSLContext() {
      SSLContext sslcontext=null;
      try {
          sslcontext = SSLContext.getInstance("SSL");
          sslcontext.init(null, new TrustManager[]{new TrustAnyTrustManager()}, new java.security.SecureRandom());
      } catch (NoSuchAlgorithmException e) {
          e.printStackTrace();
      } catch (KeyManagementException e) {
          e.printStackTrace();
      }
      return sslcontext;
  }

  private SSLContext getSSLContext() {
      if (this.sslcontext == null) {
          this.sslcontext = createSSLContext();
      }
      return this.sslcontext;
  }

  public Socket createSocket(Socket socket, String host, int port, boolean autoClose)
          throws IOException, UnknownHostException {
      return getSSLContext().getSocketFactory().createSocket(
              socket,
              host,
              port,
              autoClose
          );
  }

  public Socket createSocket(String host, int port) throws IOException,
          UnknownHostException {
      return getSSLContext().getSocketFactory().createSocket(
              host,
              port
          );
  }


  public Socket createSocket(String host, int port, InetAddress clientHost, int clientPort)
          throws IOException, UnknownHostException {
      return getSSLContext().getSocketFactory().createSocket(host, port, clientHost, clientPort);
  }

  public Socket createSocket(String host, int port, InetAddress localAddress,
          int localPort, HttpConnectionParams params) throws IOException,
          UnknownHostException, ConnectTimeoutException {
      if (params == null) {
          throw new IllegalArgumentException("Parameters may not be null");
      }
      int timeout = params.getConnectionTimeout();
      SocketFactory socketfactory = getSSLContext().getSocketFactory();
      if (timeout == 0) {
          return socketfactory.createSocket(host, port, localAddress, localPort);
      } else {
          Socket socket = socketfactory.createSocket();
          SocketAddress localaddr = new InetSocketAddress(localAddress, localPort);
          SocketAddress remoteaddr = new InetSocketAddress(host, port);
          socket.bind(localaddr);
          socket.connect(remoteaddr, timeout);
          return socket;
      }
  }

  //自定义私有类
  private static class TrustAnyTrustManager implements X509TrustManager {

      public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
      }

      public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
      }

      public X509Certificate[] getAcceptedIssuers() {
          return new X509Certificate[]{};
      }
  }


}

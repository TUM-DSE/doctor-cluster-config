{ config, ... }:

let
  # TeamA
  # Yichao Zhu
  zhuKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDmbQGsym+UoPnYIRnYSwToZyiQdw3/mRAMBgbY9iUWo4SShP4oyLxRzZf8r63Dl2jIjdsmvWZ51Hy09gWZ6eP89d4xqJO24iDJ4wUutmRUAU6o6E8STNkur25u65r2BrX6X5yRxE6quZkkrtlNgFPb2rsMf2ewsyyJEJp3ZdRWnPFdabBO1Y5kxjdWucD8BWy20yfwOFgvb9q29Hjuo+G1zbd0v9+lrnO6d/ruLESMOJwFEQajvxct6nPZRdh6UttsHRS7/4kgJYWjQztb5B7C7Z+GBgEEztnds2qjwPkNsRXA8FOaf1XU4Kt+o6jWdutDmtY3mFEmZx/iWUn1JjACidsqcqVLZClw1pN+o0tj74TPdMfL7wgZ6LeCTk8l7pvZ5mhDbF7fZVAt3AwKEq7gQTTgpi86GSAI7gEBJGcM00w9Q39LqVO3tZxsRuT/6lJMCabIr/5/uKQgXWznUvjsVDBovrMkbILCsfWYnQKagkRZuBQrzyP6EFr4riqC/qU= yukio@laptop"
  ];

  # Dan Bachar
  bacharKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDJaZ0Kcvnz5CiCoEwHTfauFgoVds+eAAKyfWHAEPP+5j+HFYuMoAoMWfRoc0YeHcrk8ndp8/uWOklToMpYeVQr8QiJm4vw97EJkyOKj06ZcM9EdRPcEh/hfWrD5Yg+ibRHI7cwYjNyyttzkY8LRnqk/ZW7IGm/baNJRAZK659f90DlktC/p2a0hwZp4gcXrx1jzXiolwR5RFmit7lRrZ7be4Llvgk/QYy1bp7FjFN2rGQClMR1ZZZIyOF00huuDj0TKKInYAZTHmQCsX/bMTonLoGKmr9tm5oDD7e28Jme1cltclHpL5rIsrWOhTQrfMBVvWCCDea8Kc4/XKMVRzB9lVK02LHaXQ7dPSTeaYjOLIB/A0QscTJ1o4ltv0YyaaVJNeOywXXmbAmTwyFJw7Pw7TAcusR98Go6vgX4K+n0448ki1AZT18TR90QpFl4JlrrdheSkgzQCDHMIS7gkUoa5APb8CR9V6WkjTrh1m5ito3GUR0XvXlKs5JsxTjSwxahf+W8hNf6wEOxTaVmfpshUkkRex+zk0MirHw66rEFiGMVfPGWfaLLYfoktDqfPsSpNEmaqqNH/YdedM97FLcmSQtV7Pvf13lak0hCsdCEWxUGyHmt5Bw8Sdgm1yteGhYk5uoqQAkuCT8cKRJbunnwdajY9Uv1eeqGpE3AvXFUjw== dan@bachar.co"
  ];
  
  # Georgiy Nefedov
  nefedovKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCucnQRinWQbKsZftfZZQAgDF2D3AEj53medrNsYY8rSZydd8MW2+ElfNpqnGjkLdSCqqOvAeOBqAWAY2iEB+HWTZxYQ9DOz+ck3Idiy9SKSUaNPX8gfRPIV0C6XLMLKdbQZCHinNJgMhZfIttJDljVhG33+czF02VsGcKzhHgHz9dzDb4+LXJjhnQR7VHE7mjLNDTBsrwrOKi6g772zUCW9GahlczdqwDRwSTy28FfvxQw+SG+px+Lf8KdLACEnaKEmTXsl4T5PBL9rglI4VP+4pOl0HSGHJrvtWh8ihvHw3Zd+yctTzw3QY4QpzbjdBnZJNtuY7FdkrHaPp8hu4xXcm/Esfg0EUL8B2nIaN34cTr1OmmjMFS6GDfD3TkRij4nXAXc3pMojzCGr6qq+gLjT5sYGU06CKXxB4eb03j8D0liQyQ4c1eC7Zyg2zOw6f2QHSuWnbdNd/e5H4OCgZbc9mtiLIYfCcP9b91Bz6xd7TjC+gVqd0nTqBQ8MD547oD90xf1tNK6DkB1Smdojf2t8iIhU3of6R6zFIResaYDU1NP4Lft1T4GQiGWrKkxK/Gifaz72PMuCtLWn6vW08K/HEEgXpPG7uHBpRLjA3GipLEtT3zuIrVyHyQv4sg0BFJ4OTJvBz71EngjROA8cqx2JxHOHsqav/a+CoYwkfITqQ== georgiynefedov@MacBook-Pro-3.local"
  ];
  #----------------------------------------------------------------------------------------------------
  # TeamB
  # Max Elia Schweigkofler
  schweigkoflerKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCx+E4VkdS2frIpGXtgYWfut+/Km5Di2WQU0CKStUa0fD2GOX93iGttCdgI8/wSzSMuornqxMMOj9CNLIBGf1umzcjDfUiKfOdzifxe3AtKsR4/gsXG9IOGscnJnvCHtTdBto2Cx2qhYkDgB99vuLn7iByBrSJsoFMPYY4yAsFq88+cYhUUrDI5P/X9ZOM8y1ntU3xO+CE2V9VUYcOo7A0lVNxJOpDxcE2QxCEz9fiKfoMxBxdV5YAgm1r68+Gtbc2CfBPQep6boyN22c2BgrZsQuFtVricNHeVgnuS5vr6QiWLi1bMrhqsVJGfnc/oGxiovYZHI+VRTk4nTOMbyJ1p3mmEm6tEGIABup1xXw328kZ4eS5aKvMXJ5oCJh5u9jQx7yBX15n+3NjXgyuKTOJX5ls5KNBgNlE20CoORfIaYcbNbCraKSqrFkk8aWeni05jl0O0L0n/AY1ngNIkExRUImbEsD1V88y+ij/AOmnvq1mZSbMFG6DWJGDdEXJLR+M= max@MacBook-Pro-Max.fritz.box"
  ];

  # Philipp Gleich
  gleichKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFxj4GgMK/7xBuTfQb22zVDtEMTodU2UxSn7mwnaSVfVCrUBl3+baQELJGGveKPJ930avtPUVWMNuoNfcFcjxX3+AHX/SiHRYK3XqZZzTOhKZ5b3PLdu4bqY6TtN2oQ2JHpP5G/WyivtbGv+55g0w7+EU1nHyIjmfgNd9F6dXjYU5GnI2nDcYclOs6jp8o/K7vPfieopKevI1NERPCLclLfkcB+rSGF+m0krkjBpjc9/sI9f0lxTFk2JEJC/Yo0r0Cy2GOCnsTK/E+Z2AFgdYlvwoQwNqfEislvZYJChSMsK9IvSwh6qv7bdxIe9F9yFBgRoVat8+y5YMzTzpaVlVct3L8gV9TewX8hvmpRQ1NOOr7XdJTRGJbBKwBFzu8/QS6fJ7c8kB7tY2WoVVu5GMiJvR6gOV6RC4GhNgA5BeiD5KkjxVzAC7PI+8dvYh5M3DF0572YIz0NmofNu6QmtzRulBhIslP1M7JaCetjcn8SCTpWmKgd28mGMkNCXORwnM= phili@LAPTOP-OQO5B739"
  ];
  
  # Mohamed Adnane AL Khiati
  alkhiatiKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/hX7ai7pCXXrneulZmdFPXSK/n0l13NIvWO4aDIsHkshl7DGZ+mWDHgdZe4B2sBXU7u6LEMXCWeD8jEDK9AtobIxsNAEiemlWvbfWmGM4yiupml3Mh4j1s2tipCcsEbgarPaxt/klEj4uuYYVoJrXPZ/wSwWKPqGUQROKzPtdBzMhBygl+wT2vlZMZpiia+awG0gGcdM+3JwxgDgCN8IrZJOnS9DKj2OyLNiI55RuSXhPB70WUuSKV55Hjki77G+TKZb560K7DV6yuIWElGbZdzYIYvPUb7yee66k4eGewoN4SnHbd0+0KVFgbAKlAVIumINf+x9LQOm+y2vMVQ/TDxAXZ06jK9xHxqWINIhKeuxo/yQu6dB+H5Y8XFZQ9C9Oiil4ICkyLbLck638kHzREuOpWl76IUW3phFfaQwTrf0i5Z7vxFqcWEhvxdnQAR0ROkrXUDY1aIH8JKvgjYLW21+aJ0PIgzRs+iwzZN+bLZdVuh4bFt433xBhVFYUN9k= mac@r108009.ga1.swh.mhn.de"
  ];
  #----------------------------------------------------------------------------------------------------
  # TeamC
  # Adrien Maes
  maesKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCo/xsaGNmn6exK8NXyDjiRJrVrc/ywd2mHg7ynhJ1Id98Oz7lH7rifQYaFvICoOqVZRXjTX4uOEv5coADshv+SzjA5ihzMV4CZobm9lnol7+L9By9qHz04BMuvEpB9xaCgi3o4LPYv/Gi1eRImbM2Fehh/3XAdbkwuJWT7+wajq7MUqcs5ClbmyCOy/uT47e3EkCzGhE7zHDIhUB79TNRrWhuPq9g8/EfSscqiXSUQwhN6Rq6KBd6uBDYoiNNCd/UclcnLw5TLuWsIPvAo2xI734wuilaIfNyNOYI2ySGq7GbmSTIFrasPswcq/Ib+JcgubGv+S9r4U+L6zX4SnNOh adrien@Adrien-Pro"
  ];

  # Andrea Misuraca
  misuracaKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkOo56WkUek4w/2UESnoLkJIKLX8OyeJHU4PCwkERfhbMxwT5Nd1FjXkA2ZUkh9ifoRxoe0ykEhPf5h4M6md7h4XlUWwOiSdux6TXvEQ5IfTGthKOdJk2mznv5dEIsKUmrXQsSnz/N0QAmlQ4ObKLBKI/adww0aT5l4EPCdOgfgEOvo2kKDbc2ojTrAedoMX8T5iLpg/fmb+HBwDI/+uQEx/j7WnSO3l04MqRWK4292wdEkhTT7acS4AOt16+2FxZ/kzMwci7mR2HGoCwlJ1upNv1Zp460oSkbtHwjTUk6zgP7p3XmcF59cUicspHdgYXflckbwEp5F1GJ7+UwmHB1 andrea.misuraca@tum.de"
  ];
  
  # Mark Pirkowski
  pirkowskiKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD4jT3ZQYqxem5irnvM1zHMXWyRUFgZL8ofwvHsJ93FfdJhUwz7Av/mJvMPQzzMXHY8TcNMowBi/AEmP2oVEZfJgPDKOasYrmJaxPHAa9UAP8DpuYuJ9/3XMpN1T8UXFA/rBsGbOa0LlTAmzXujTnbv9AOIwX9OAWUwfZrLb/YRCwzVZE2Z/IPWAKAANn1t2cenfPKpkmlbcsYC1qWEkrzBE54FK3HRzKmlNRkZvo0fAlRn0blzVvFdEmT3ePEGkHd/ew3tm8qAkep0+hCfAGkmMX2FeJx1x0SUvvmElqaq1IF4GYEPcL8xc4ztDbJrm1P4193GFmambqOdj9ERjOKRdSVXJpUfbp/QF0b42oMpOYD5HV7YObkkzAyIDs4OXQIj1qEVBUJk5m7LXkOu33khsP6A3ibPeIF7/IgdOmHU+ad8XYUqpqRGqvv3iiw0VOpzTByHxCxFH/ZlFaYzyxwNvvQal+qsd+GgJxwuMqO/JHu0d+/aVXwG2S7gQE3qLuFF3LoH8TWWPkXJ09bUF/HbCWxV5oDVvt1GwHqUq3DTwwQI6PiJcwLz1n7hWv3NC/Vo96UME5Q2HM1GAluoygNYz6Uhk/KxqB80wxc3mL1h/2ZdHb0T9hQMfC3WWOcJlHxns6lxBeA/4gehqsbY0H9NSZ4OmGLAmQ5P69PcLvonDw== ge93wut@mytum.de"
  ];
  #----------------------------------------------------------------------------------------------------
  # TeamD
  # Vladimir Romanenko
  romanenkoKeys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC44JLMFBDsLJkBpeD+7miZQ7eGnbb09xaTEnPCPExNM"];

  # Leon Kastner
  KastnerKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDqO/bcPxnCW6OZUOqveeySvAEKfXIheOtgIfrKmmuzlzK7dfboi8e/xOyEjhR/mfIwJlQ+KfcI+x4WABGcl9zXDEyVUGGxQxOYwzRz8ZR/PT/iXy/SvrHuArRsWo1lairTiEruHjAU/XckBsBM5ZUsKRdnn3yiET7WEJKDvwVvhW+ZdQWlE9/jkpBeRQ8ytIZ4kyrtpOIy39vu6YrVqYLRhJxy1qvZfnysC6x0mMRhNqVykc32n7jAfMWSH2r4uHJoeeGt/6odz8yEobad4SwGiTHAUmWvVpDr6yPZOXTmfU7I3C5/A/klRkHkOn/qMlCxjJ8sBsSeyyWij/sZJm0VsDR3MVQ4foEtH0Uu+7Sk4O2WuBO0Hws99Mp/IoRoZ3pVzrmYVp9+atMy/YVIC+BOcOmB9VpRQt/8skvjGJOzUXX5KUia0W9uHvGa7u9XGXLoQERwaM7HdkElIYlCYpIcIZ40XU2BWYgr2zUZi2gSIa1f9tDSlQxV7bGJxO5xe98= leon_@DESKTOP-P1244EA"
  ];
  
  # Piotr Kedra
  kedraKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDznY87yngTiCeRPmY1Yzw0i8/EBeSGipn10dSUTEs3jTy2x1zRQ1V3t7giV5FckYOQ9Yx3Ja0QsBHxJ9+dl3WrLTCoMLjEnjA75EGbVXmJ72wT3dbpsF3sJxQM7v/K5pZK++2uRaXE5yUXl5Q/L6Ik527YSS9tNP+xVYXH49ufS2kGEMPORGV0W/Kd8wEYL7muNEF3apeQpextIbOB9rU0j6ZBcfV8tOyaUz/DjG2uapIL1xxzRnHgDv6EfKSJ8PzRUWRmyQqrxN6N7K7kscvBo/muD9LpgcFYmwkvMGvT1MZDlw++kI9N7HpV4rZSA4UtRvTCCvKXfJWqur4svyO3mFPHflK4B+ADkM9RzFdEPPuykcOeBxMRahA+9kUkAZ+U3nCXC7l2RqtSWMSfFRkYE9f2GzFHg6PJc2z/15wb+xDdSKk9YhI2RVJosuZL9IJHd+xm7/Wkc6QIZ+JYc6/+s9yyJh7Z6PNjmOM8XsK0wBDz2t+dIHIwPTxDQXyhwF2hGd18TB/0SV9ZZC0wGaELKRCWonMvldGJQn9Mc1Ef3AOm73CLRnqFmtwR8+nbwM5KHQ4R8nARh+UfYj9StoZnhmNnyHZScA7gZBKyCGMbvmyYQRHWmG2ojnHSJ+3U/mIqoLs2GsvOgZV1Y+OZrKUki1iNN8BxEUboX8+Snl4/tQ== piotr.k9750@gmail.com"
  ];
  #----------------------------------------------------------------------------------------------------
  # TeamE
  # Horia Balaban
  balabanKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPsMcOW7s/nCkqlPD7eTBUOnVJm/z9O8uV941mqnd0OusQAepExpOe6oX/dhrP3mw2TTR/rI+JDhA0Oa7GPcZZPv/IArycSPAvorfgraidbimtgmnMEePi2jJdFS/n/J5Fcm614YFpSjA8JSRuoADC9Dxni8EJmHF0uccln4Qe3hv7RTeohWmorLVLORl1yFOk7UADWwOGGQCES2uNeWuFIBq+GHG6znEP+d6eI6bmNLTgTApjlTK32E2y6HR68XiQCLKoOcMcW1zgsI9b7zrnZX54ZcNRY3Dm90WtpZQNSzEgg8oPLoLiBIgrZTb6XzqB8Ncw7ZjGPZalV+XMYfe/ hrjk@hrjk"
  ];

  # Paul Candea
  candeaKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnvOy44nRcGnRFfyOjqZttjQPWKw7tPydMu+Yj6IneGowEJqoAqoGDR+mCdQVBrT7y81w0SWC1X6Glv5Tfu0mh8k9scHtBnFIxs2k4FnhB4tF1q67sigz92+/4a6zFqLNokFzNUYPm1zWWfi59cDj98ysjlUBNGauChgCfMsNYctjoU2EtKIRCUjL+dXR3tYyzcCz5erN/B+CYNNlR+opBAybHJqjYYXjHZeTnMEwxCZShddq1G25zW3/X/T+E27xMkGgzV5u38hBCK9coHg4AgLVJEipknmBo0mbeBvB55SRnKMKVmXhDCSRJ1je5kyiy4CnNJPpjUTGH/qqNosJt r4zvi@R4zvi"
  ];
  
  # Dan Lionis
  lionisKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuMTr7eaNJPD+bKZNpw3osDInBSBCrBh7Fp102zfr3PXyCyE6ForKh1nSLZTTLFKMgLWSIzkcefXbvEa39zXwFAhexxrbfRgh1/WjdKL5HM8Pn+OrirWoMstIkuJNlxwjc3bKJoItEeVXYYRm65audiQqZrzlfl+yFczDJRWKB3S9a36BgNA75s03jcLVea9HZhdN2IWwMxpE5DzJRlMoCcjyKpk4DLXQ+z7Xo5mo2i7MLBvgiqds+LWJoTeIcoSdJFiedreLOZoGxXIVJvaiZ0CIl3YW3uODaxS4I5+1LI8oIbwYPa9fbDfpHdk/PfYEbtPzdskzy89HSl6DZf6MYtP+ZGVX4yFkiFyYLCKCJ+K0/H07oxG0GVyNiQ5LjidGdwDUTzLzZXYYxOSBCz0Qzp75JFLz+xzkNDexE3jOJeWHA4B1yrpLmsj5UR08mGRETq4mQ12n81GCQ0bMMhrTaMNiG5lq4t4i1A/fO9b06TH9acSM5OwIjIWs+Bzd1NGk= dan@dan"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC+uglSpt9ntOMPVxqNFubfNM7EMlbQHNCq3WBk39FRBiODJP1IuTmW5biTBlYnC1lN8Ye4HgBKTJBy9vtHJSbTtKffcR0TUcUw8I8GO6Sj4BdO4fJlm2W2OONGPKH7dv4W6EizwfRgOz+9Jyawb0PM9PooAJslnT0hkE76WdlitVSHYdgkfQghnSUHxF5wJg/epqQDFVoJIInEtTRiYp2pqiDhXzLG4/uQCKYbqa9mmPqN9arWHNK9IEHfhwYlyhU1iOw4uyoERqEhaSch1R0EFKOXeDjEyVYIV6Ql11qSe+GVgJWVL3DEzOeizYDDItkWaVY/jD0YMLWJIAX5q4cZ90mzRtel+KxAtpoDEK/rDARwL20fcY+2iXJeesY7ZvMWpT/wb8Z81WbbxFRiZa9Gzj4g0V1+BT1n/2nCB60G/9n1eGXf8NTX6THOuYIQuCD754YgG7RqIL6agXtwTVT8axZhJgww/Gehofr4+hyWD4uGIkbc53qFimIWR1ybLT7lTOLqSd3efTfCb7+4OoayOo39r8xNaq9MFj/PA5O5mx4/BQf0IUcrp/R4bl14zhEpSLviNxzGzLo4RQ4bT/2BgBE5cVW+9ROcBoyvZQzKW7zGfWz8kMt4XZGy63nwaoacKJMF/U5ng1IunTkUh7uuTY2dqlpYkppV90+2RYodfQ=="
  ];
  
  #----------------------------------------------------------------------------------------------------
  # TeamF
  # M Asim
  asimKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDAQC1NdDk7wZREJTdbYbwjJI8WKzrRQL5i2rXh3lBlysF0qnlq++m8GRR30ADtmhYs7W+8oK1AlOzxFAaYcZUFKOsb8+DfibyMf9TT+3vX5vShp8514MkL2xyHmromdie4YwUFsrl41iaDfEazwUY5+iIia+t83eKjnznbnsYho1h4xTQGz+c1mfwyM5Ald2BJcgivBz6OjhcNP4it11iHDeFoOyQZJM+syW7CSRctl5HdF4c4K6eMKcZsvajm4lA+MvXpztO7aWx4nGPQ/KgcpS+h0UyZvAd3z7viHq8P7Xl0uuaQQ+Zy0xvVeOV59Qs7mc2nDnV0Mvqkq3pasz9d1nsKKkqJmC/Pm1P7thnY/rAjFd6cyZoEREwYTM9A9YZVEKY7fzlDPLeA3LXQYfk1jtz539GD/BMtBalepLyFTfx7kHM3U9tnxFQF8G62N1CcxCuR07UrqnFGjntgA0z914Xd+nTKwZ6j/BpwcPNv2HjehKUwqzjWfuTMTItvYGnWdiBwfBLC3hhp2mlMIqfZhZP51mStutHvOOZl593V5zq3mrMjccg3TAtzd/CAKSnKsJ1vGGrJtisayPliJysFTnKtHiecsZzH7GaGb9cnjHj3KqdMraPv5OtzhFwhikc9bC8Vhc9OfqQ9DPptG1KZjnT9X8ODn16+efi2BmELaQ== miana@DESKTOP-C4S5NVI"
  ];

  # Wenli Gao
  wenliKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCy4HOVNL22DP6B5etTrJvN2A/QeX7jzZdoDs3VQGj9bWeNeVKVnavraW+jpzo+gizaV3tnPu/tdaVLLl755wqysQc5FWn0eoCxGbgYvaku0kpuDbJly5cvq2R01qB8mkrnV92EsyppUUxe3hw9wEyY7iy665vw3ZTRZpBnZelrl5D2Bv9KK2jSBx2k80GHfwEErXfu42DDsx9jnTLa9qTN2zE+LX9PCGBh35Qv1llJ+CHreFsWVlWdyNT5QFIGHW22tLQuCjcBg+l+rwqb19yA2UpEZgY2OUR/8gk2GUJwYJhKgRfHQnqU15P1cVTXqHTkzjvs1XHb6vok+qrwgOmkIt0eIuik5WE5QHeTP62B9xsaJMj65qrFSscjzJ3dxyXU0XixWdT1ibvcbWh08wRO4nt47RobTROUPkqszyoFn+reQ2MXZy/fkA29yZPG/WkDpRdrzRU1yGwf7mHG5DGswltiCfDFdAIg3Yy696KBA+fbNtIq9ZG+1hmYake9JsE="
  ];
  
  # Adrian Montoya
  montoyaKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQsV0dOrYhAMXMKhg/zJxqeYLWBH5AoLSFO9AdsWinw0rGWwPCr4ec5DfXjDBsex+GggPqRfCE34KREdeaUkK/A08pCpUCK4DEqwmwM5sVDldMybnksPwTIEWtwbRUbLZWZpnaCn1MxUWgpGMXe2xj31dNCMUl/p/EsgwiITfT4nwmxoeVshV6fyb4hRQ4wlPh4XajvVaTQwkz6YikHTxeucFUoWzKfqjd7+wVv58am5kxzo6zar5jXa75/1ae/StUCMdBKSQcqqVoEOul+Ne+XDGpuw2GGV5tJIhTTbLLwKccjqH+Xnd3lVepzzEsj+xz9DW4AujpHiTBumLheJuXXiatdmhTtyqGmDAxeh9+FX4+2SsHWesS3p7h3Ao6tUU58xhNkTKsgojyFnWdr4g7nOzQC1q2T5Yir7rPdm2GU3mHr3RNpqdQaSglqT/Snnnb1Af877oT47ckJoMwJAe0Tkr7yWIPsFifYIR61nLxZyE94WOCHvAeycBmIvei+lc= emrys@Adrians-MBP"

  ];
  #----------------------------------------------------------------------------------------------------
in
{
  #OS management course users
  users.users = {
    # TeamA
    teama = {
      isNormalUser = true;
      home = "/home/teama";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4000;
      openssh.authorizedKeys.keys = zhuKeys ++ bacharKeys ++ nefedovKeys ++ misuracaKeys;
    };
    
    # TeamB
    teamb = {
      isNormalUser = true;
      home = "/home/teamb";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4001;
      openssh.authorizedKeys.keys = [ ];
    };
    
    # TeamC
    teamc = {
      isNormalUser = true;
      home = "/home/teamc";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4002;
      openssh.authorizedKeys.keys = maesKeys;
    };
    
    # TeamD
    teamd = {
      isNormalUser = true;
      home = "/home/teamd";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4003;
      openssh.authorizedKeys.keys = romanenkoKeys ++ pirkowskiKeys ++ kedraKeys ++ gleichKeys;
    };

    # TeamE
    teame = {
      isNormalUser = true;
      home = "/home/teame";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4004;
      openssh.authorizedKeys.keys = balabanKeys ++ candeaKeys ++ lionisKeys;
    };
    
    # TeamF
    teamf = {
      isNormalUser = true;
      home = "/home/teamf";
      inherit (config.users.users.joerg) extraGroups;
      shell = "/run/current-system/sw/bin/bash";
      uid = 4005;
      openssh.authorizedKeys.keys = asimKeys ++ wenliKeys ++ montoyaKeys;
    };
  };
}

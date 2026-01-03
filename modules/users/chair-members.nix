{ config, lib, ... }:
let

  manosKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDM2v+i/htewdNuABRqzG2dURVgogpi7i4HclT0PABKHw4mLnSAfbCLrWGx3vs/bfPekGEZWyyWA/Bkq2rhBqnN3x3b1XHH7PUy7tJUHDHzvt8KGGav+w9EUdfhHTx44mcOoKMd33fBICOCRt5CwR4v72rg0Nel8ps9PzPBALBJ0/8pvP4eTjM6D9d1ugKtobFOOyGvsV1ipcR+Ao6KPfRl2K498xeZY2wHclVeUXQh9WIGUD/Sr2+bo0ub5GSQR4FR79CvTuOPAskKJcLZvfyCSKxkNbnDI6oI7TVk3ITObR3Of+1jJuvxb7bdu1VhVgH4LQQcpKiAv/tSQTgx/tR1GSjIWITi4Z4AKggpLeVrVFkL5TbmuHX0HcMw5GzQEl2XoRdLCemv8QBy9W/aIKQRr6H3SDzluQGGmCFnpKljXE0WRBjMAgWOiHkX5zW6U2KkjJzG0V9RTEQj/h91UDzok0SCX+EK8auvy+ptk+AICG3elji5UI9qNQdh+tb4utk= manosgior@DESKTOP-N9JDD19"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDEhz0XKaqcBkZrvzwM6dNtM0/JYm6dwHLfcJJ7PcVuQrUn10nSXjhEURtCqaUyx1TiQ8JGgo5va3l/3qPa2QFX+COiKbBebdiyH+xRZBsZP4iVB0zhwju4cO5OlUP4hSYYm8y1DfQQr/qjB3Fx09uiYsFY+dBAIjUZhwXVJHKJgZ/AoEAbhcUClcjyHcU5KaCOf7KgtYHDIltG4J5SEiJ/CR1SgTZ1NaaRSjZnWqi2c9uo54ve6lu8hKKq4JHCEhb3cNM9ZnNPhRfCrpnD7mTKY3jz92FeMChGACDWQAUT/okNq7+VNtlrAjgW6i4XKptNJHz80apkIG2T3Sy4OoZ6sqrDU+AxhBUeeRqIOoRZU/l6i6RtvHCGwoVkpzAKjNLA+tXOxTVPqBNg8IJlyAVjWq2lLYzaR0ci4wV1jvH4McWE59qw50RQ2jsbOurX9Z2ILpK8jz/enkVYyar70LJ7/JfyK6s77GHWpPatWWxMNEGghxm2fm6zvT1YTGgpxbM= manosgior@DESKTOP-N9JDD19"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUF8kwXqS/GNlrzJ2unEymDjX9qFi3/bAihzbl9ImBS0FI+09CuKp9UQVPO81PTgalDRHqQ/bk1oG/0GhBu9QPYN6KE4DbqA491mSfoAg1MF+nL04wapEH4q8jbo7sobPNi0+bCc/Efry53/tuAT38K8KI/veCXUuTS2SwdpvqAcRTYW/+lP+4TOcBy07oA12fY7XCOC0zZiNmuSo8tg5drkG7rC9LCoMWI6edOnTE6KAtv+Xwe30I+0Zshi8+zI5jM4/rdoolyG4ukjuoD6gh56TPkT4bcZFy50IsBz+LXN2hRAFv6rZVMZwuwb5zFN1Y+QPciVw9G8S8pwVe0QcL manosgior@manosgior"
  ];

  atsushiKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDuPk8qYR8pJkAZmG6d+Jh0dJwDx2FuVThZJGI00Djk1mD6qQD0NIAFv29v9nvOX9u5wpMTVAbdC0RMqrmTAgYwJ/kpFe7+Tjr7v/Oi1AlaseBpSOCdAQcmtFdza2y5f0D1AnFuRBTKvdY8ACYbnPhKCqcVH8/9EXYe6UVZQv2Gcdllc7LcZiP/g8bMhF+FB7qOzPFPOCapqMzX0lIEvtaxJb4s9pLWXJJQkIK15IQT8UuB7W3JBQO0+5VMwLpMAPcnVgn/nhTRbytngbbZWyuETmh5XuhI4KX49KC4qrW823Ujf3XXV65QYb5XI/n8Dr6481u2TLRIXkDz5wVTV2Kd atsushi@koshiba-mac.local"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrh1vZu6iNxesJ3zu2K8LYkr+yuvx6gR4SabKp6R5aMjr/qlccpcwBMPqEV+/piHyiZ131Mki7LYLRBCnxwoZ0DTI4j9WMZ4zI2luN9pQGraN6Of+es+mx/XRpcRI4oVmXXzA1n1f+PpGGz0JVx4jq3NbuMbbgv2CgoS9AbErqY1nDfEfcbquj6KiMi3jUckZZ51qKNAWBxvqNV1pIWdLsbxJnIjRaAJ/P2fQHvsyPSYiyh4gwUj8eNyFiU7Ko3JnRHTXCbwx7FTYAp73Ga2w7ZgW4Yt70wiZEiAOthjQj+moT1TfbQF+4tfYS8/jcDMyPBlOTsw6EzS7LWHyR08xP atsushi@atsushi-vb"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCn1Vx2/JLKXn/o362Rt3nAX4RJNwuO04kt9yw3GQkID4PevH9yW4UYQGjk2pu5DaPku9fRk0M5A40gS+4j4YC0ALnzJn8ZXpHqSD9OmJ1mt+3oWsrb+MOo7zPKHnR/Zy975JHBKv3C905K/6qFkpAnQer7DuHQHY8DfxgGlhhrfpqnV3BI9wO4A/Pn75wUOcLCf29Z+Z0YQrfikeyMEDKk1cEl3V+IWWOpdjckQAyAH8pJv1hN4BjWndW7Gk36TOykVU1SF8SIuhu13jLzf8ZiUrVK0UnJGPp6zTTwTQ7FChf3uKXHEviSR8ARIfFjBNht7z65ooVZDhyUfjmZVn5u0PpIfs9DNPE7B2rqHShHfHgicfVBJZ2eJH5pnhP6Yqmg56Q8Gmj6X8Jz4Ffc3LE3UTWRVNzOoP54baocTz2R974infbOjNt4aPJ5mzsK6bgIi4W6XlMq+Pk+DsoQUk/2a2T0bNGMpMdq/1Y5WaVnvZnP7WjqIvqIzVZyD8A4CPc= atsushi@hinoki"
  ];

  dimitraKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUXap/inau3PgwfwwzA/xgjPFwMIDNlNlQ6FDPxUS1bFxvLUewLlP7tHEjlU4aCe5/KPqtbnEOuU3ZBRBPiGAXA1WxIofQH4GLD9kUoxQXk3n9budu7Ni0Mc7fk4B4yKA6hAxdy78FDbWyJe7UMYhFvDJs9+A7HnxishLKrea3LjDVxW/2dhpIDOj7jKDJKh56m8WQn7Msb1w02f7o0J46EA49y1hlJFuGjLHSYwx5O7flFh2tyKiARDuriqp64rSLONWXmOWDX8d+JcnIZJGrMXxTWIuuqxkdsw0tvi7g/msDQrn8DVGX2sRxoGYksKMrMhYAAAoLiwH0Zi2777DZ demy@ubuntu"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDkFay+8y99fYWHXCn3JJG+iuA9UN4oEdUD2l4C5oyE+j9gIpc1m4TzNYOmBHmvZRKKwhrHKr8ORHdtm26+iQCkV2j5/AuununfsuXr/pL+Zmm+muKgVPdtturCEEa5uzfEiuFHa2BiwW4FarBu1pC/Oc35R8NOByDAPe190iOS4kf1JhlhbOjUHjf7b823FwDfqAteNVINyNoIBWG/yJBv9Xzlr62G2DNkUo9VLreANCgTwuLwP1q3gxavlUNIDsZYJ+k1TdjB0OK1T7MgCvz4gUIjLadYgnMi9qGeq5eiJxmcK1VUDenlY1rzKpTbt3pZwgFO9OX4OxGWczCSbKImi0UdpbsMoVnIHm6xe2Y+c54/AgeVztsWeD4L9PArrdjBaXkcy/ALs+xNhQEJgPZifU6PkL9c1PP++n7IozLZSTHex2WdXAqxsXTeEuE7ldpzAQL5Hnj3qsaIcdrccd9iWslfSBnWxFjqE3+bPe71I+1c1sdI0hP7OGQng+8ReKS6hL7LkzsJlDfI6k/WUg299K4Xq/ljqE7rT9K6/qxe8E2bBvo18DhgZ0WhPuwsDpGyZm9DwnYDN8Xuv5QutzPYyuGmm65YNjJ9I7Dhq4npKXVtZGZI/46KsvDqr6StLKyCNZywxdMFW3FN01+QWtRWNPCBJlYTE3r1pveEkM26Q== demy@ubuntu"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAZ8RRWQz/Sy8L+H6eUQJOROlV733U/Ir32SaQP+rLrQGfkqE3oguRDtHfj6NEA98q7eaQDx9v57EUpHe9rTDDF/JSjoOsbWEF90M7mMTqBjFAb742pB/CVOplyhnniZh22vruu+GC6hBjd4cg9Qw6IPueZLB4f1nkXSCboW0YY3I4Gaq9DFlk2Gi8G1VQv1tYa5+6i9eOEW/+h2VUQkHtCbNYFnt/5wlsTkP6Gh6MeBRkrUQMOgNmYfJhPtE0ZLTkrTs7BZCW5i5CE68kXyYWh2WHLKM1Z3vw1SA2MuEpQPdoKRwpiQf+ZoWeciVd9+1RXcS7PAWcOJg854I9RyRhDlErAS1ENmO3ivqEYo2FNd+Sin+/uvG0c8IJONJMZyWOnaLb+dLfV0/0EdAo1htFLFefp83DtK9r1QcYoFgAL7kwYk9Ox4R9CDt3y/UueMbmWC3W+jSyUm03LZJkJa0tXkKE0cZYcajoH2cdSWjZdUbhr00jBjzJoovGb1tKw2k= dimitra@rose"
  ];

  dimitriosKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC8PDKvdmcJIyd5C7XfCEKXQdbVv8f1sy3+/jl0EEyQA17xVU00lR9my36QLk9R6YKRo1EF2CHf9jNrQ6q3+cZJJEX4uv0gdicYiISy9+aPBAOEiQ6bfatxQmYMXOwv3Hv7EP5rEmPPCwFR8neLQEAvXjY/yucIeyAPqKFNU73OH8rqR++AmUQGAi7LGCVTYYQQ+uTBHR5H7YcvyzElDgGBWgxWJRzU+hm410BjItHYtP51dQejqKLGWCqp6r3slgWdZ9Lg/tytv5fzl19JiOV61TQ83hmgtsdXn7pgzp9OFAOXClYm0P6DwMdO/bRDp003zzO6/jS1Hphi4gvYxnrXlEFebzqLG6AMhoR6BUgPSUmQQZFedxxQC6WAGrSt2loZp739Tf1vJtF4Ep+WRb/DITss1VRYYxjPExgETM7BGqVICEdrqkM+aERxUbkfy2HbFdzP1J4P3wXGFuKtBUuEyvmT4eE4D+Zlfh7lhGw3IXkNj+YEeLigGnqVACvCUqa3HyLNwXB/4m4GRN5/noEi5I8VKgTxdrycRdSsBd4gNIOf0QjtVAD6CGkmWQURh28GD4Plyaz+H8BAsaWuH3aX4wIyV6+6rfPyO5T5rgIMxJkYoD6lWupwY1qO36KSC7A4sS0HcAPR16EZghMcMC4FNy4PGLIlUuwJ7KJd0Ptlyw== dimitrios.stavrakakis@hotmail.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGaFuDu8EM/hA5UtAc3Q+0zXvRcwT6P6TZhtps/3R518 dimstav23@Spam"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDafd2SX0Mi6kiKXNaSYmMO71dFIVbBGLpaMt/MO4uzoX8rihtud4CIbCXm8iO+I/p7c8e5lfkyJbnmJsXS6VfkohP4K36V0r0ZQhXhU01KpgC86z8uAnPGowuvGQGseMPG5lR5qAC4keENx1wiIn+fP5N7xUNVQTLc9KKNswLYwzEj6hRvI+ZoUybNuEieqb251vcFzGGZ/+i8PyEJ8xhxql91QtmxKHeZTn1ogbr1AAlWFESnhvxY1ky48BKKAKSD9kEXB+iszjd6a2DvilD0C60b9yPeSRsKVAXhuy+/swcFs0ly5KV3FNWDKV9KGJP1aaRSgX0RE6C5MCdbjARv dimstav23@Spam"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINOtq2p1WbvKsV63p1+GhgfDxMmN3dFUL+IM1/HcWSqJ dimstav23@gmail.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHM2c6Z1MvCqi75iKSbZDUCWnNEwxmU9hoXKDCk//qBo dimstav23@lenovo"
  ];

  felixKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOtPYKJOWfanR0dTkoQuYWA7XtiiPiVTYqpldjIuEk4w" ];

  harshanavkisKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCk5NDpY5ZdeUZl1jwiPuUgDad9i9oKxq2Ocm/P2Nf6SVMgl6aaiWEPzS7QfkZpOCqwtBqnBdUoykvQ8RwGCBoA7H9KiV0laqZFIbdNmiFKhZX4KQk8WVVxBlVgUIpLfp1eN7iu1PX0shO7/+zkObF2lAP2XMWpPOanfB1sHS2Um4AdEaYo+4QlUdrBS3WwBDLnuZdsG6B3CfAfVdj+zuJALnKdd/p+HUzDKD031SFGYUT7pzvsOVkmrvNbSv3l2dbVUKVjC7NDTMb3tk0iIGT5RdyYNth6mdR4EgtjNl+vZqWiM/1wRoY7SZ1gmSaXkgNNU3DM9tU7IHc0JFGXjRCxdNVy8EuxZ0f/szvVt9RyuCizkpJ6WJBKjqX651uDLxNJ4FV2qTK4jBANKpWVt5J4BIjCeIOCTSsRoW61WSefQy2LovHr/1B9/vmYsOsicYOd41lcCjJ1AuHIY6HzYS7nvxaFHoC0hvxJsFgCxHUHjDqjfuRaiBthtZu/2cRWcJybYWmsfRn7cKPKFNo7VscC1Hu0YVyKQMxyzq1y9lC54IXjoFrnkicUYYLA6jU5qwoadvPqCSnGfOZBKSW1gFOZYfGKlf0u/CDCqdm1IfVGXQwONzJaELhpmV9bcING0cXLs+XfLe5kPhg7vXb8qHTgC37Jtodf/+s3M4SbW7WA4w== hvub@hack-haven"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCY1+b1HIuJ4hy+NMst9qjJmBCY9Zyk8rrZlUyXGy0ll06kLwUiDNzcKUuKFH1y3zsn+1yGZFFjZUWi4mnpyNWSkSsQ1HJcuz2bFLw+5UyF42K+HPyeq6SE7xZcZ/cEE508Mqms/hIjl+tffRtoA2jxDZNdEjk9Qq/gzuYJo0b13bqpDRnrU1vUIk7egw4XOU29Wl7tpdKiESf6fow+Hi71BoLUeBjtJp6lRr/oqmpxPcFgI4BQD61VuPH3BeQIlZl8TWmqiZ+XjOHxxqkDCH+f4ZdM++P1p8kIkhz8wZ3ajNIbJFnqCxOBkd/zTNLnKCmZafW0SlIm1rLh8W1na97wKJCGCPjTVzrq5dVTG6sEApuBx1kTk3Ir44V78CwkN2X0bTJmWyj/5QxF5cEbKlkP9UKmSFiDlk5/nnxPsWkNhIzyaEMTP/pZFWgAK1aWXwh9/kLn/YSTjKs5BhIjEw4EuFybWgiNzn2Cy38Ir5oR1XA+vmS0flti4K9eHWGzjxGcSb53jOcqWdILiTV0iPq+0H1mUCr5ZIUGF06FBjdEkpxlmg9PsTdf/uIkvkicYVQLUsG25oNZg+oOa0eJEuAqR48VSDvNwUn2sbaX22J22eQFEkaqgr+W6oGOny87Ig6fFglNNWQeLOS/mJ8HKnRS2rkxu2i6VYwLZIulVGpS7Q== hvub@TUM-Thinkpad"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICIcTGN4oUHWpslXebHwhZjs2BKljT/HUmVf2ipcvDhb jan_2026"
  ];

  chenjiyangKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDV7fuUwU8Ox3QvTIBioAtVX7iJomrcxzvbiBccv6W+G3slUFOy4fii+K/ERC5RPeBM1sKy2If9pWptHozJh9YpJiinSYm/c97SVlAGEHR01RNhD9IixGppFgfeuqgjrMuYAHqLBkNlAlIa2CZB16+sIXx7GP8pgowMVrl8PfTW2xjIiZhGwbd1dVrIx5VkIl/sf4WC22kBPnqxnfQows6W9OlCSAi/V9IKCGNPwZHOv/63qbFhpS5AHyRe48EQIcdjTgCwXeLTeIfa69tUADF372hCZxEUjb/r1B6xTbv4P312d6DJ6NHpFNBpELeZaDJuDus4hk+Ej4q1dHp6mkqGolhKbwLAfNcPoiIOs1XipLOxoQwoXDQ69gfszLddWUGme2uv9UHF+yYkYPYXpiSGy1n00tYOBpKwCCCJAEpGILtj9AmyTzf+TfFX8tL9bH6WiXYHMDRBdFlJzic7XLwFAuvbWSFQhTEHyqbTtcqQuktm76vPtL+XowAzB33QRJR7ev7+9dOnnmGa1CikQdiJBXmkfMwhaSAQRZU+FroD2LxuMAsemaOvlVwItgOrLftt+v5tHg716lXf1CcmYIsz4m0T6uL8wvyV/PrAXkI2SXrgSC28z+h0+LCdrNxlTlZK0vYrAOV01ma0fPAYTSLxbSqx6/37m/nnrubTkRiHMw== chenjiyang1991@gmail.com"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQKfHPI48+W3BKOeotOcAVLDh1TMWCqEy6Ltq2te/NPgoommDqqfnTDBf1lt6ShUG44H8V3VEJapyC/JhA6l3MfJPBCGqdHgBx+ECEn2lsUX3NY4n5fhNph4L/cZpI4JyI+mbRJFAXMMvSV52OXKgx8/Sp+BIthZ7CpwOVpTFEfu/5j7NFE7c2T/iXL8NwmzoV7b9EfLGd+Y5MBtQSxwLGoHIv7+aan/boj65mY0x99exJN/MSDjQe1bjxE9hUD4xYC5XRnUl6XSrPWtQWFfwXnuYLxT177L6V7TEsfZ6EV/GeVuoJpizVxIiN/oImrf1PWPCucr5DFXcWkVQ+QClN chenjiyang@victus"
    "sh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDCKzDeT4zRveNXCt3D2+pllN/3HaY9iPTO86Rn5CDHW chenjiyang1991@gmail.com"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC8gXtpJq6uxzK2fWP5GkF1O2ESetKBbDNRjvzvG/yfFbyaTlwtC1JRydC7gbZKLSAVBk1mjO2tNbQ413rpqP9qVufPu68Wj0T2ZzfxtVGdBhk8j/AlG7s71KoH0mu57MLt5Ar2L9tLPLJChmzJP/bc5mIDlPUtiJ7+n3nVU3DsFRt+w13cQ+iHAvTxKVTjPVacrIorhHAeUw4KOD3wnuPEtYqzFnmizzDFFxP2AoivC5aQ0xtIgdoCSG1YBvn3SQzaF55JnO8wmk+OMJ8EKucwkdf6JyoTM/3oh1wxHOSj9jaIfLT4YDonDcPgivbueWxQj7Qjos31P9Ult5Uy7hLtgfVNbXAzjjSkQGQYt06/WNORSJJ5jdTdODjXRfDHXBudugEM3J8fspyHGaViPaHujkiNheRK9OR58zIG6omXwraMYbXqACQvOqZ74r3nOE8MxNdGhSq5GsiDJ/lNYh5XWCbMt8+NtmhbUAcMYbtLSLcPKyX8zTdjAM+JN37neKuS94vZCigh8V3AwHx/PGh8W7pkWHYwXmNeiWgBsbWcckzoY+OSCDj1zTUsDioMefvVM4gESMdfq/Uw1XhKyO2adnooQKDNVNPlXdYORQaLyfEuEecNHmBQ8Lsdc8IwXUG2AHwPXG5E7N8Gqo6ArTJAPfao6eGAoAUFmaKRg0GL4Q== chenjiyang1991@gmail.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqpz+1+6rNq5ez911qwLxtnt0R+Wvq3iesmupf3Q8A4 victus-linux-22.04"
  ];

  cmainasKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/UeXK/s6ZU9cp05safmSmiQ+kwLacZcDipO4/3aEiYjkq6Nf9/OLINLhg0QbPhvXLwJRh7CuEBkWOSNQx+u5rcemHA8GnhVIfWCoUSMEiZma4W3DvkzuLSxmaT9LZGZGOZkHJV6uNF1QnVeOyD0oafXiivVMow6Rr/HLIruvHfaM2xxj2EJsRdkXHHyBveXc44l/FAWfljU5DrpyLo03D4UI2Ko63MP02YLuNmZU2Rnb4LAPdFzJ6sGf1DX0UIabKvOBj/MJqzfZvRhmU3z2MuKDK97JbV2WiQhBm4NOd61Iid35nlODgRhL8CGArwrk86vufEtHndWy5DRwg0M7q/DvEYd7iNXDN8DKca+6UtQsNBTa8a5eOZuBvMAXsEWpBwKaIjpTVw9NeJd9Yt52Wj+LNRtChJJr5Z8UltC9TWFkyiJPNVfxuNhagW+OgmzK/LKXAGp2l+24U1ntBTdT9PONg2LWpxbfHGsYfhC4FWyE/HzJ5vSC6rGOdACjPYFFiAh5VsbLOTPrlF6Xu40Plm/BiFAE/Cr1n16LFu2sPe1PlKs+1pdhStTN0GzlV1y6VmFPmcYecpB/K7ZV0gJOe2ERqyb8yOqJp50evcwtzF3ZJKR9qRMjOXycOwdqigDU3+nCKHrWz6XwYkHUwLZ7ydJVDbzwT7rDlc871kRm7Nw=="
  ];

  masaKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIODydnvMp1+Ppx4J4IwXtnxwJhAVrFc4oRj5GEmimX8 masanori.misono@in.tum.de"
  ];

  sebastianKeys = [
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBG0TjS/uGWx3om7H8NsEZR6fA2SmEq89SxBfb43Mwe91fi7+O8oxrdQgcjk5Xo9cvSGmSKYIxH+TJVoNJBh5dkU= sebastian@ReimersS-T16"
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOxedj13JHRmts0X34Gs7FPDO4T3qEUw7Yu6TPufNLnvD8DlkUGyUKGQAuXd97pOfX5YOg+sI2NSk/1uBoZlW8U="
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBYcRp+3vOyxwxDybx5qgXRK1Cms1xnhGDYUJtPpOmFhNEcYIo9VHQjn4A7f5EKxxpSzJTFO71d4nyRsSfk695g="
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEI39WgHgoAXtZ0HDWXjuRrUr5eXLm11RRaAQxX/AZLB43UGEqSLtSkXXViD7af5eaxHSICiuRbatp8wU9aKerU="
  ];

  patrickKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBzLGDgXaT6+pWNDa5UazUO2RAvlWwkrGLNiWHSy+dkp"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBovteXjmdsqJ432B4rZillIjnfe7Sx2LhfMg2WtkAks"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAIW6vfXtJDp7/ZehGQbjOfMXio4Ojjr7xU5YkN31PSi"
  ];

  franciscoKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCbtiYJVC8KwmoNxBH9O65JgGsCUIfXLWNmAe6ec8Wyzu3XJr4vNVRSLEFHaI6eXc+ynuS87l+CM4QDXSiA2/g2vSKGS+il+yQq9F0WJ6jJZpkQs1hciGakCiPoUCxodqBxDQ6RYZmeE0ZYmD0eXHHU5KRt0HTK33FgjTVEgNdT8cPckJ5v0qLtxOyRfi3N1QhQssxiVf+FQBoMloe+BtzF9bIaXTylojV6I9V7pGTqqnQITZ31uKfRLoLGpWScFDhhFU7rmBO4mBk4q4aUva7KqhDMHSRv3lZeSGGlMRO8EXkhoriy6wAwG9okPo/LM6+mnnuTlhu6TMy5+Eye0YovaayYpSCWiAa5vx0uh8lxdM3Ttxb2MxB3nBlWXyvEI1aYeYDNNQVaUmg483hdho++19xS7aKd0VORQBlNURfMSZ5wSIlmohMXvgi0lzjqLGOSkewWuQKDG4+G+VlDQMPJpX+AcNR2JVw6mIciSK0fx5zCoDVX8MhMCeEQ2IUjZg0= romano@dockingstation03"
  ];

  ilyaKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFjTHpdkrcZhIU1caiNi1n+NeSWMqhfeW2ookRJzMxaBXZ7CLLJWtzmNl/E76PDUdU97Kok+z49V0xPkNzJOAhc9a3mUjldJZHtqEXTnXMcr6CUqRHRh/0Jo7Q/xmfPn58IKjptLpgBZP9eZQQ4fqhQmuOcFvWF/v/NQV1rdqs4n5FbMd7W0CG7DJhz4Oh2Z8JgTP5g7VpxCK10Q148a9CKDBXB/PoVKHGHLdklCglv8spSCUT/BANymOdAiqpySOVg5QJmbojyHSD73NW3apmo6Ey2YfCsfVaUVuE/VmESOzvNLRW2WBHX6/8+8evUs/kwlTvE4deWBPd2/KPpqpwXT6JwiwXiUwxWs6n15fLd08pqf/5wbNMA0kLtM2xskPGykxMVu+CZBSw4O8tiufFodEaC3BAwBObtEWqaHI+wURQaDfRdZP6uBWvgeyL4LuUwuZzmP3oW38qqjOtlP1h9CNaE7W1iFQSBijnsSAkLVP4rXo6A8+LTBj2qS5R/Ks= meandres@kushana"
  ];

  anatoleKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCqbnkl4OVgJGhO/CRhPnnMCsHGAE77jnbpWMoCLniKNgqLVwPBpevfJed9gwmrUdUKnAdvKP/+EIUMydjqC1VkYVXB0oNWd372hpxOmu9lYziXwQA7m0R2b8VhKwE3KXg2kZfDq8vW35ZQ5F/jGmMwBVSRuYP2cBo0BBMlEniYhgiPlUT7TzPttx0TmSCDUCj9CaSZ3rAGbyjT7ezcFFAQQEMd0EYvSa04B12EpYNLKf1rIcMrEEOUn7pwwF1kbpSLvVeP+0FnxokxiSlKKCKNMB2igE4ahJI2XH2HMTb20Ce/NKwGU79ZwWnwtsjXJV+qoqmh5VSyzKlwfBvELLNR anatole@MSI_GX740"
  ];

  teofilKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINkwdkIadTpo9JCWnxwtTiQu/PmQW7W4wAYZtVNGAqZK" ];

  nicoloKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB2SyU4I0uC/qjsK2En6WNwnGaf05UGYKv8Yq0iMJcIg nicarp@TUM-Thinkpad"
  ];

  davidKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOspUL7xyTeVmDpu5C6rode5SjqNPLekcQho6YRDG7gT david.schall@tum.de"
  ];

  mfKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINK0/PSpRypoFe8NQ1BHjCyxraIvhX/0q6OIO7DYnmyq Martin Fink"
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBCshvYXlVtnaApJlB5BFhfZLWXnY4/9JKdNf3PFuPV8ZKU2Ssk7uAR5O5COVKDb9HnvArF7v+eoxKFmhwGXnlEU= Martin Fink"
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBHGipyrOUVsSJNF2b944RUj1ywfdKqsgAhJW4rBbyjOPV2gx5LVLB5M9Cq71WBJIdmxOJ1slAtHhb0QI6JFjCTU= Martin Fink"
  ];

  nateKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEenzPGBeBJCMro5So/3v5AJR9w1ebybVrfSddFslbqR nathanieltornow@MacBook-Pro-4.local"
  ];

  aleksandraKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMq8uZ112OCsUx/gjZFhO4pJv/qpm80SHNp7dOrstevY aswierkowska@aswierkowska-thinkpad"
  ];

  thoreKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFQCP93wmHUCOKn5W42KnzyBQBjltRp5RU23WbAMlgy5 TUM"
  ];

  theoKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCvGQ0aKNGTkaEjjkGkaQ+8vA83Tbl5fpjuGTPrmszZuxzmSx4/6kw7Py4faLRJfcFNPdPp9FfFxsqCLpYMWKYVmdojQHIGBTugTtaadCrQ4W0Su6WcTN3OLa6n9heo+SE4Z+Uk1dUys0jMaZoKH7x/x2Yd9Zwg9sd0O2oa65VFV831mVGnagSrk+pJBh1MprmDEgobsRVFDEC8bENe23S58Hpvp6c7kLJnNlb11ojVAJBPBmH1QLwKceW66iRQPAmHJdqx5xCIWO1qkOut/hzNuDQMghGabsfh9huWpInZBVSH29pEWWw4CiPgACVzFBTojqcmlRiTMiszX7MiPkIfLCilpQF/KtavhGihq4yRs+6UxKV/4ErYItZeDaI5kgU+19cug12newP8wks9hJNpXX3N0wXYM0M8ZPvXc61z7EfRfpBMh5XLj9RMnSfuGFfoGKkRcWgx9nx+69FwqNQYsbL+id8U0lHqas6ai6gEbecF8UJv/r2h0zDaoKhNv70= taugoust@fedora"
  ];

  julianKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZs04queaSB/BGQesCEiunOkeEydB5rJ2WUXSrGlDLVoJ6/Q7fAHM99200fxK7h0vtKda4OkdUEBtRtq2wn+Z0YW51mFvzJ7214ZIY4JKtYX02KW8r7gVXYmjoX3VWEKi5iKfld0WO9jaDN3InU5CYyYx1nHl+BNasxIHtUzjhHCC+Ggxt3Kc+IxW2DV8J9/JwhKhgedqvqbc93+V05/UeYwG0Q9z1mwBEuOlGv8yP6uhCWmHzxbJYo+oxU5nSXM0lPHecxa7M8hROXEVrSxg27vUg7JoiSQ1wt3lzNQS4Abd8JLqOJlQYQvbz5Xxd0KhD0kaBCptXBCxdOo+YLi06XNs16rRtQPM51jTrero3h1wfA51XR7w7j52nbLC2ZGMyaSO1c5IQ5d5Xad/F1ZcOQQWvFhK+ie9LJzvR0AXiFXzEBvmPiZ82rLdjWGPO4975fSYTOxshZojk7oV4fQyd5vKCsjChL0JC2chPfYRv2kti/9CVqVseznVMPE/JgdE= julian@mind"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCkHALCUCursw1AvmYaQLfYBee1lGR4sqqlTEHfatyAqQrCxFnWNnO03ScEfNsDQKDZPRQ/RZYOOHlNxoKQzYaHlpbFafePKNH+lKZWibabp4HT3ho0mi56i2sqXLSMP+y3nz4S7vx678CVgyK1/gW9wB0ORNh1Ss1NqPhi/DFxHVxcLig3mjCVoC6QzIzTLq8uVP/bOD2jtED/PSdAFQQNd2RjKWea7UjjH7IiQvvJHwl1OB8X1x7mxwuQuHCMj7kwwKfEEvqOy3NiDzY9Ewc7HihFLkROMK3obbYLoQjYf/tP9SYpekWx4Q8CpgmvAblwDcv8unmnYAN2Cj5PQ4YulBPCOwNfmVCvsp3gX8eLG6XNYjnHt7DIEm8Yj4EeSCuB6DLOR2Em5eKH57qzQFHyubdIwVoY1xzfdd1wzaKuL+ahoLKmZ23Q6bK795BwZBogyoceREg9surF9P8l9mJi2Yn8aGMtCF9ecIySNGYwI1AqKGYX14Vo9HA3nfADCI1wCND5LyqD6UDGfM1iBV38gGl05jyywcTgpctI4ryQy6SUDf9x+CZuDwHXihR6Rj9Oj1Vy6zFdCKq4xt76xCsIPuy+6CY4RdOkCNmQn3NKeRnttLmyYIpLbHkTdYs8GIyLsf1mz6uHZNcWg5fwPTabgT8PJ5yJRQo9IoXGawf+vQ== julian.pritzi@gmail.com"
  ];

  andersKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILvxKVGEeM9rh1CJYothgKcOvNrAxKHYOD9K2tX8wcsr"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIfzGHxcRgfwt3SZ0iTY+stOgi2yAORrBpnwJ1tCMn7h"
  ];

  dennisKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFHf4fYi0N++0qTWfJwdp4JkLtHi6sgKA81U3tVrD0eJ"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMyl7CnlZltO3IFHlogUGH6WaztW6i/m5noOgB0s4XXI"
  ];

  anubhavKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCpbDrBEK7kwqqutJ9Y1naVLO1txdy+uKar5FGxxGWvKb02RrJefAizJ+7FSqmTIrLEWQPs9yhfVWUk8jlH8PxxroPD2m89BztAaCr9c3RUWAU/PWsJKB3gxDownYC3uZt/4j8DIwnBMKMq8fJt9GQ3O36XxZ2OSJp7kJ1vbKhYYXyMoGfZnDJMo+zfFJkJNfoLb1HR1IIHAmM7dvF5s997VuDMprJ3PqnIVp+zQc/QpPlBHSpRYI9WxOtSo+kdF0yA1GbtbnY76A/IeapDWVfhUR2cEKyCIia0Y4Rgv57W7Hnu5kKTWm3jpUyMTkcAji/rrvrNjvmSybFv9xqlXL0cCwSStQ1TgE59M8WYIxTNtThGhVfD5EfnnPixU6AQmJT7oLp7F8k2Jy7JBTMM9qM06Xy4vhkDE2OyyUSZ596GoWotqa7pcRXGLzm7Z2zSmIUGVW84VA2t/A+ZynghXYJtG7MwQWSSf0RHV8lUDsRQAmImTsToONVXZtqq6pzOY6c= anubhav@anubhav-ROG"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDPGx6ZevvIeVpRzN5CmUuC7dskP/8sFsYJUA165reuYP5TGb9FDnDvd1VtV+rr12lvXCbqbB5vFkbtWCFQ5qblSoNuqD3fhwL6/+tF8WVUy1TvxfpXAUpIiByIukIGF6zIw4KVwcv54jEy11quxb5+MIYY0fR+GOfG0AiHjmr56c09xvzRIa4jDVDyXjwYE4FMw4X1oXv2S3puaXa3OPRExP9uUNV95KuqPDGkuetoDeqmK17MR9yb9xKvW4F2nEMc8jG34QmZlos5XGxxqJz1krQJODF35zYDWz9nje15Xk0PRkOgde0AVKHHI9SmyH9pAtCrMyc6ch1YL6z0z/0BumEbZ20JYnvxuFGxbnEX0tCoM9Vvq8KaUKkbwaeEZWeWC5pOnLLsIOSJqLdoisUNCCb3OfkXfTnSoP1235+jrH5m/rOCYsERQ0wkaC9sQwSxK2eYpdD897XY1cXDveqoKx5tV/gUR6gho1SSRJHF8k7gZ4nDu3eNmiX/uQcpOoRAEyCp5jgJMgDucr9I81DODOX3G+KdvUiawB/lOf2CQX0NTBhxo74Fqy+P4NB0T7nWQ/0n2X9XNjtiMGRh+NmRUqZQvtglOuRGjZ9OOXBL+zhSraYQGO8GsyLhVLYmXrNhYH39qRl2XfkjgyynfuOe8TuL9GW2UBDA3d3dx7dLXQ== panda@Anubhavs-MacBook-Pro.local"
  ];

  extraGroups = [
    "wheel"
    "docker"
    "plugdev"
    "vboxusers"
    "adbusers"
    "input"
    "video"
    "staff"
  ];
in
{
  config = {
    # admin uids in this range (1000 and 1008) but not in this file
    users.users = {
      # Dimitra Giantsidi
      # edinburgh
      dimitra = {
        isNormalUser = true;
        home = "/home/dimitra";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1001;
        openssh.authorizedKeys.keys = dimitraKeys;
      };

      # Dimitris Stavrakakis
      dimitrios = {
        isNormalUser = true;
        home = "/home/dimitrios";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1004;
        openssh.authorizedKeys.keys = dimitriosKeys;
      };

      # Felix Gust
      felix = {
        isNormalUser = true;
        home = "/home/felix";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 2022;
        allowedHosts = [ "all" ];
        openssh.authorizedKeys.keys = felixKeys;
        xrdpAccess = true;
      };

      # Harshavardhan Unnibhavi
      harshanavkis = {
        isNormalUser = true;
        home = "/home/harshanavkis";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1005;
        openssh.authorizedKeys.keys = harshanavkisKeys;
      };

      # Atsushi Koshiba
      atsushi = {
        isNormalUser = true;
        home = "/home/atsushi";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1012;
        openssh.authorizedKeys.keys = atsushiKeys;
        xrdpAccess = true;
      };

      # Martin Fink
      martin = {
        isNormalUser = true;
        home = "/home/martin";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1016;
        openssh.authorizedKeys.keys = mfKeys;
      };

      # Jiyang Chen
      chenjiyang = {
        isNormalUser = true;
        home = "/home/chenjiyang";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1019;
        openssh.authorizedKeys.keys = chenjiyangKeys;
        xrdpAccess = true;
      };

      # Charalampos Mainas
      cmainas = {
        isNormalUser = true;
        home = "/home/cmainas";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1020;
        openssh.authorizedKeys.keys = cmainasKeys;
      };

      # Masanori Misono
      masa = {
        isNormalUser = true;
        home = "/home/masa";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1021;
        openssh.authorizedKeys.keys = masaKeys;
      };

      # Sebastian Reimers
      sebastian = {
        isNormalUser = true;
        home = "/home/sebastian";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1022;
        openssh.authorizedKeys.keys = sebastianKeys;
      };

      # Francisco Romao
      # tum
      francisco = {
        isNormalUser = true;
        home = "/home/francisco";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1026;
        openssh.authorizedKeys.keys = franciscoKeys;
        xrdpAccess = true;
      };

      # Patrick Sabanic
      # tum
      patrick = {
        isNormalUser = true;
        home = "/home/patrick";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1027;
        openssh.authorizedKeys.keys = patrickKeys;
      };

      # Manos Giortamis
      # tum
      manos = {
        isNormalUser = true;
        home = "/home/manosgior";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1028;
        openssh.authorizedKeys.keys = manosKeys;
      };

      # Ilya Meignan--Masson
      # tum
      ilya = {
        isNormalUser = true;
        home = "/home/ilya";
        extraGroups = extraGroups ++ [
          "kvm"
          "elasticsearch"
        ];
        shell = "/run/current-system/sw/bin/bash";
        uid = 1030;
        openssh.authorizedKeys.keys = ilyaKeys;
      };

      # Anatole Lefort
      # tum
      anatole = {
        isNormalUser = true;
        home = "/home/anatole";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1031;
        openssh.authorizedKeys.keys = anatoleKeys;
      };

      # Teofil Bodea
      # tum
      teofil = {
        isNormalUser = true;
        home = "/home/teofil";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1032;
        openssh.authorizedKeys.keys = teofilKeys;
        xrdpAccess = true;
      };

      # Nicolo Carpentieri
      # tum
      nicolo = {
        isNormalUser = true;
        home = "/home/nicolo";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 1034;
        openssh.authorizedKeys.keys = nicoloKeys;
      };

      # David Schall
      # tum
      david = {
        isNormalUser = true;
        home = "/home/david";
        extraGroups = extraGroups ++ [
          "kvm"
        ];
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1035;
        openssh.authorizedKeys.keys = davidKeys;
      };

      # Julian Pritzi
      julian = {
        isNormalUser = true;
        home = "/home/julian";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 2000;
        allowedHosts = [ "all" ];
        openssh.authorizedKeys.keys = julianKeys;
      };

      #  Nathaniel Tornow
      nate = {
        isNormalUser = true;
        home = "/home/nate";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 2028;
        allowedHosts = [ "all" ];
        openssh.authorizedKeys.keys = nateKeys;
      };

      # Aleksandra Świerkowska
      aleksandra = {
        isNormalUser = true;
        home = "/home/aleksandra";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 2029;
        allowedHosts = [ "all" ];
        openssh.authorizedKeys.keys = aleksandraKeys;
      };

      # Thore Sommer
      thore = {
        isNormalUser = true;
        home = "/home/thore";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/fish";
        uid = 2030;
        allowedHosts = [ "all" ];
        openssh.authorizedKeys.keys = thoreKeys;
      };

      # Theofilos Augoustis
      theo = {
        isNormalUser = true;
        home = "/home/theo";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 2016;
        allowedHosts = [ "all" ];
        openssh.authorizedKeys.keys = theoKeys;
      };

      # Anders Choi
      anders = {
        isNormalUser = true;
        home = "/home/anders";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 2074;
        allowedHosts = [ "all" ];
        openssh.authorizedKeys.keys = andersKeys;
      };

      # Dennis Sprokholt
      dennis = {
        isNormalUser = true;
        home = "/home/dennis";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/zsh";
        uid = 1036;
        allowedHosts = [ "all" ];
        openssh.authorizedKeys.keys = dennisKeys;
      };

      # Anubhav Panda
      anubhav = {
        isNormalUser = true;
        home = "/home/anubhav";
        inherit extraGroups;
        shell = "/run/current-system/sw/bin/bash";
        uid = 2049;
        allowedHosts = [ "all" ];
        openssh.authorizedKeys.keys = anubhavKeys;
        xrdpAccess = true;
      };

      # add staff to root account as well
      root.openssh.authorizedKeys.keys =
        let
          staff = builtins.filter (user: builtins.elem "staff" user.extraGroups) (
            builtins.attrValues config.users.users
          );
        in
        lib.concatMap (user: user.openssh.authorizedKeys.keys) staff;
    };

    # DANGER ZONE!
    # Make sure all data is backed up before adding user names here. This will
    # delete all data of the associated user
    users.deletedUsers = [
      "martinkl"
      "dimitria"
      "matthias"
      "redha"
      "oguzcan"
      "evgeny"
      "sandro"
    ];

    nix.settings.trusted-users = [
      "joerg"
      "harshanavkis"
      "martin"
    ];
  };
}

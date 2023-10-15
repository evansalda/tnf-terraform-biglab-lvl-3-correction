resource "aws_elasticache_cluster" "memcached" {
  cluster_id         = "nuumfactory-biglab-${var.environnement}-memcached-${var.digit}"
  engine             = "memcached"
  node_type          = "cache.t2.micro"
  security_group_ids = [aws_security_group.memcached.id]
  subnet_group_name  = aws_elasticache_subnet_group.memcached.name
  num_cache_nodes    = 2
  port               = 11211
}

resource "aws_elasticache_subnet_group" "memcached" {
  name       = "nuumfactory-biglab-${var.environnement}-memcached-subnet-group-${var.digit}"
  subnet_ids = [aws_subnet.private_3.id, aws_subnet.private_4.id]
}
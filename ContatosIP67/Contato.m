//
//  Contato.m
//  ContatosIP67
//
//  Created by ios4548 on 30/08/14.
//  Copyright (c) 2014 ios4548. All rights reserved.
//

#import "Contato.h"

@implementation Contato

-(void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.nome forKey:@"nome"];
    [aCoder encodeObject:self.telefone forKey:@"telefone"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.endereco forKey:@"endereco"];
    [aCoder encodeObject:self.site forKey:@"site"];
}

-(id) initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        [self setNome:[aDecoder decodeObjectForKey:@"nome"]];
        [self setTelefone:[aDecoder decodeObjectForKey:@"telefone"]];
        [self setEmail:[aDecoder decodeObjectForKey:@"email"]];
        [self setEndereco:[aDecoder decodeObjectForKey:@"endereco"]];
        [self setSite:[aDecoder decodeObjectForKey:@"site"]];
    }
    return self;
}

@end
